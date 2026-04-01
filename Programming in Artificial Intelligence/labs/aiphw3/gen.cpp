#include <iostream>
#include <vector>
#include <random>
#include <functional>
#include <iomanip>

// Function to generate and print a tensor of a given size
void generate_tensor(int size, std::mt19937& gen) {
    std::uniform_real_distribution<float> dis(-5.0f, 5.0f);
    // std::uniform_int_distribution<int> dis(-2, 2);
    std::cout << size << std::endl;
    for (int i = 0; i < size; ++i) {
        std::cout << std::fixed << std::setprecision(6) << dis(gen) << " ";
    }
    std::cout << std::endl;
}

int main() {
    std::random_device rd;
    std::mt19937 gen(rd());

    // 7 key constants
    const int N = 2, Cin = 2, Cout = 3, H = 4, W = 4, K = 3, FCout = 5;
    std::cout << N << " " << Cin << " " << Cout << " " << H << " "
              << W << " " << K << " " << FCout << std::endl;

    const int FCin = Cout * (H / 2) * (W / 2);

    // Generate X0: (N, Cin, H, W)
    generate_tensor(N * Cin * H * W, gen);

    // Generate Kc: (Cout, Cin, K, K)
    generate_tensor(Cout * Cin * K * K, gen);

    // Generate Bc: (Cout)
    generate_tensor(Cout, gen);

    // Generate Wl: (FCout, FCin)
    generate_tensor(FCout * FCin, gen);

    // Generate Bl: (FCout)
    generate_tensor(FCout, gen);

    // Generate labels
    std::uniform_int_distribution<int> label_dis(0, FCout - 1);
    for (int i = 0; i < N; ++i) {
        std::cout << label_dis(gen) << " ";
    }
    std::cout << std::endl;

    return 0;
}
