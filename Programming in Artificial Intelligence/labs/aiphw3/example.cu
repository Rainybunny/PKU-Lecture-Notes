#include "functional.cuh"

#include <cstdio>
#include <vector>

float* fromVec(const std::vector<float>& ini) {
    float* d_array;
    size_t size = ini.size() * sizeof(float);
    cudaMalloc(&d_array, size);
    cudaMemcpy(d_array, ini.data(), size, cudaMemcpyHostToDevice);
    return d_array;
}

std::vector<float> toVec(const float* d_array, size_t size) {
    std::vector<float> host_array(size);
    cudaMemcpy(host_array.data(), d_array, size * sizeof(float), cudaMemcpyDeviceToHost);
    return host_array;
}

float* readVec() {
    int n;
    scanf("%d", &n);
    std::vector<float> host_array(n);
    for (auto& v : host_array) scanf("%f", &v);
    return fromVec(host_array);
}

void showVec(const float* d_array, size_t size) {
    auto host_array = toVec(d_array, size);
    for (auto v : host_array) {
        printf("%.6f ", v + 1e-9f);
    }
    printf("\n");
}

int main() {
    int N, Cin, Cout, H, W, K, FCout;
    scanf("%d%d%d%d%d%d%d", &N, &Cin, &Cout, &H, &W, &K, &FCout);

    auto X0 = readVec(); // (N, C, H, W)
    auto Kc = readVec(); // (Cout, Cin, K, K)
    auto Bc = readVec(); // (Cout)
    auto X1 = fromVec(std::vector<float>(N * Cout * H * W)); // (N, Cout, H, W)
    forward_conv2d(X0, X1, Kc, Bc, N, Cin, H, W, Cout, K);
    auto X2 = fromVec(std::vector<float>(N * Cout * (H / 2) * (W / 2)));
    auto M = fromVec(std::vector<float>(N * Cout * H * W));
    forward_maxpool(X1, X2, M, N, Cout, H, W, 2);

    const int FCin = Cout * (H / 2) * (W / 2);
    auto Wl = readVec(); // (FCout, FCin)
    auto Bl = readVec(); // (FCout)
    auto X3 = fromVec(std::vector<float>(N * FCout));
    forward_fc(X2, X3, Wl, Bl, N, FCin, FCout);

    auto X4 = fromVec(std::vector<float>(N * FCout));
    forward_softmax(X3, X4, N, FCout);

    auto X5 = fromVec(std::vector<float>(N));
    int *label = nullptr, labels_host[N];
    for (int i = 0; i < N; ++i) {
        scanf("%d", &labels_host[i]);
    }
    cudaMalloc(&label, N * sizeof(int));
    cudaMemcpy(label, labels_host, N * sizeof(int), cudaMemcpyHostToDevice);
    float loss_host, *loss_device = nullptr;
    cudaMalloc(&loss_device, sizeof(float));
    forward_celoss(X4, label, N, FCout, loss_device);
    cudaMemcpy(&loss_host, loss_device, sizeof(float), cudaMemcpyDeviceToHost);

    /* backpropagate to get dX1~dX3 */
    auto dX3 = fromVec(std::vector<float>(N * FCout));
    backward_softmax_celoss(X4, label, N, FCout, dX3);

    auto dX2 = fromVec(std::vector<float>(N * FCin));
    auto dWl = fromVec(std::vector<float>(FCout * FCin));
    auto dBl = fromVec(std::vector<float>(FCout));
    backward_fc(X2, X3, Wl, Bl, N, FCin, FCout, dX3, dX2, dWl, dBl);

    auto dX1 = fromVec(std::vector<float>(N * Cout * H * W));
    backward_maxpool(X1, X2, M, N, Cout, H, W, 2, dX2, dX1);

    cudaDeviceSynchronize();

    printf("X1:\n"); showVec(X1, N * Cout * H * W);
    printf("X2:\n"); showVec(X2, N * Cout * (H/2) * (W/2));
    printf("X3:\n"); showVec(X3, N * FCout);
    printf("X4:\n"); showVec(X4, N * FCout);
    // printf("X5 (loss): %.6f\n", loss_host);

    printf("dX3:\n"); showVec(dX3, N * FCout);
    printf("dX2:\n"); showVec(dX2, N * FCin);
    printf("dX1:\n"); showVec(dX1, N * Cout * H * W);
    return 0;
}