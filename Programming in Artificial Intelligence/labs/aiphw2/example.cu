#include "tensor.cuh"
#include "functional.cuh"

#include <iostream>

int main() {
    auto x = Tensor<float>({3, 2}, device_t::CPU, true).fromVector({-1, 2, -3, 4, 0, 0});
    auto y = sigmoid(sigmoid(relu(x)));
    // y = relu(y);
    y.backward();

    std::cout << "x: ";
    for (const auto& v : x.dataVec()) std::cout << v << " ";
    std::cout << "\ny: ";
    for (const auto& v : y.dataVec()) std::cout << v << " ";
    std::cout << "\ngx: ";
    for (const auto& v : x.gradVec()) std::cout << v << " ";
    std::cout << "\ngy: ";
    for (const auto& v : y.gradVec()) std::cout << v << " ";
    // std::cout << "\nz: ";
    // for (const auto& v : z.toVector()) std::cout << v << " ";
    // std::cout << "\ngy: ";
    // for (const auto& v : gy.toVector()) std::cout << v << " ";
    // std::cout << "\ngz: ";
    // for (const auto& v : gz.toVector()) std::cout << v << " ";
    std::cout << std::endl;
    return 0;
}