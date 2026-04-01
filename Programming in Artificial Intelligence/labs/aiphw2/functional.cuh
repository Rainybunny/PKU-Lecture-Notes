#ifndef FUNCTIONAL_CUH
#define FUNCTIONAL_CUH

#include "cudabase.cuh"
#include "tensor.cuh"

DataType
struct ReLU : public Function<data_t> {
    std::vector<Tensor<data_t>> in;
    ReLU() : Function<data_t>("ReLU") {}

    Tensor<data_t> forward(const Tensor<data_t>& input) {
        in.clear();
        in.emplace_back(input);
        auto self_ptr = std::shared_ptr<ReLU<data_t>>
            (this, [](ReLU<data_t>* p) { delete p; });
        Tensor<data_t> output(input.shape, input.device, input.useGrad, self_ptr);
        auto in_data = input.data.get();
        auto out_data = output.data.get();
        if (input.device == device_t::CPU) {
            auto data = output.data.get();
            for (size_t i = 0; i < output.size; ++i) {
                out_data[i] += in_data[i] * (in_data[i] > 0);
            }
        } else {
            GpuFunc::relu KERNEL_SET(input.size) (in_data, out_data, input.size);
        }
        return output;
    }

    void backward(const Tensor<data_t>& out) const {
        auto in_data = in[0].data.get();
        auto grad_out_data = out.grad.get();
        auto grad_in_data = in[0].grad.get();
        if (in[0].device == device_t::CPU) {
            for (size_t i = 0; i < out.size; ++i) {
                grad_in_data[i] += grad_out_data[i] * (in_data[i] > 0);
            }
        } else {
            GpuFunc::reluGradAdd KERNEL_SET(out.size) (
                in_data, grad_out_data, grad_in_data, out.size
            );
        }
    }

    const std::vector<Tensor<data_t>>& parents() const override { return in; }
};

DataType
struct Sigmoid : public Function<data_t> {
    std::vector<Tensor<data_t>> in;
    Sigmoid() : Function<data_t>("Sigmoid") {}

    Tensor<data_t> forward(const Tensor<data_t>& input) {
        in.clear();
        in.emplace_back(input);
        auto self_ptr = std::shared_ptr<Sigmoid<data_t>>
            (this, [](Sigmoid<data_t>* p) { delete p; });
        Tensor<data_t> output(input.shape, input.device, input.useGrad, self_ptr);
        auto in_data = input.data.get();
        auto out_data = output.data.get();
        if (input.device == device_t::CPU) {
            for (size_t i = 0; i < output.size; ++i) {
                out_data[i] = 1 / (1 + exp(-in_data[i]));
            }
        } else {
            GpuFunc::sigmoid KERNEL_SET(input.size) (in_data, out_data, input.size);
        }
        return output;
    }

    void backward(const Tensor<data_t>& out) const {
        auto in_data = in[0].data.get();
        auto grad_out_data = out.grad.get();
        auto grad_in_data = in[0].grad.get();
        if (in[0].device == device_t::CPU) {
            for (size_t i = 0; i < out.size; ++i) {
                data_t sig = 1 / (1 + exp(-in_data[i]));
                grad_in_data[i] += grad_out_data[i] * sig * (1 - sig);
            }
        } else {
            GpuFunc::sigmoidGradAdd KERNEL_SET(out.size) (
                in_data, grad_out_data, grad_in_data, out.size
            );
        }
    }

    const std::vector<Tensor<data_t>>& parents() const override { return in; }
};

/**
 * Convenient calls
 * NOTE THAT usage like ReLU<data_t>().forward(input) CANNOT backpropagate properly
 */
DataType
Tensor<data_t> relu(const Tensor<data_t>& input) {
    return (new ReLU<data_t>())->forward(input);
}

DataType
Tensor<data_t> sigmoid(const Tensor<data_t>& input) {
    return (new Sigmoid<data_t>())->forward(input);
}

#endif // FUNCTIONAL_CUH
