from PIL import Image
from matplotlib import pyplot as plt
plt.switch_backend('Agg')
import numpy as np

raw_image = Image.open("./p7-raw.png")
raw_tensor = np.array(raw_image) / 255.0
raw_channels = [raw_tensor[:, :, i] for i in range(3)]

U0, S0, V0 = np.linalg.svd(raw_channels[0])
U1, S1, V1 = np.linalg.svd(raw_channels[1])
U2, S2, V2 = np.linalg.svd(raw_channels[2])
U = [U0, U1, U2]
S = [S0, S1, S2]
V = [V0, V1, V2]

def generate_approx():
    for dim in [1, 2, 4, 8, 16]:
        new_tensor = np.zeros_like(raw_tensor)
        for i in range(3):
            approx_channel = np.zeros_like(raw_channels[i])
            for j in range(dim):
                u = U[i][:, j].reshape(-1, 1)
                v = V[i][j, :].reshape(1, -1)
                approx_channel += S[i][j] * np.dot(u, v)
            new_tensor[:, :, i] = np.clip(approx_channel * 255, 0, 255)

        new_image = Image.fromarray(new_tensor.astype(np.uint8))
        # new_image.save(f"./p7-approx-{dim}.bmp")
        new_image.save(f"./p7-approx-{dim}.png")

def check_frobenius():
    frob_norms = []
    frob_svd_estimates = []
    percents = []
    frob_whole = np.sqrt(np.sum(raw_tensor ** 2))
    for dim in [1, 2, 4, 8, 16]:
        # app_image = Image.open(f"./p7-approx-{dim}.bmp")
        app_image = Image.open(f"./p7-approx-{dim}.png")
        app_tensor = np.array(app_image) / 255.0
        frob_norm = np.sqrt(np.sum(app_tensor ** 2))
        frob_svd_estimate = 0
        for i in range(3):
            frob_svd_estimate += np.sum(S[i][:dim] ** 2)
        frob_svd_estimate = np.sqrt(frob_svd_estimate)
        percent = frob_norm / frob_whole * 100
        percents.append(percent)
        frob_norms.append(frob_norm)
        frob_svd_estimates.append(frob_svd_estimate)
    return frob_whole, frob_norms, frob_svd_estimates, percents

def draw_plot(X, y0, y1, y2, percents):
    plt.figure()
    plt.plot(X, [y0] * len(X), 'o-', label='F-norm of Original Image')
    plt.plot(X, y1, 's--', label='F-norm of Approximated Image')
    plt.plot(X, y2, 'd-.', label='Estimated F-norm from SVD')
    for i in range(len(X)):
        plt.text(X[i], y1[i], f"{percents[i]:.2f}%", fontsize=8, ha='right', va='bottom')
    plt.xlabel('Number of Singular Values Used per Channel')
    plt.ylabel('F-norm')
    plt.title('F-norm Approximation')
    plt.legend()
    plt.grid(True)
    plt.savefig('./p7-plot.png')

# generate_approx()
X = [1, 2, 4, 8, 16]
y0, y1, y2, percents = check_frobenius()
draw_plot(X, y0, y1, y2, percents)
