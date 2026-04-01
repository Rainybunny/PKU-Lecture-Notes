import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

with open('result.txt', 'r') as f:
    plt.rcParams['axes.unicode_minus'] = False
    fig = plt.figure(figsize=(14, 8))
    ax = fig.add_subplot(50,1,(1,49))
    ax.grid(linestyle = "--")
    ax.spines['top'].set_visible(False) 
    ax.spines['right'].set_visible(False)

    outfile = 'report.png'
    xplt = list(range(-10, 3))
    yplt = [152.165668, 151.868475, 152.109564, 154.479162, 154.440939,
            152.267694, 152.561381, 150.967605, 150.885035, 150.268453,
            0.000435, 0.000605, 0.000692]
    ax.plot(xplt, yplt, color="black", linewidth=1, marker='o', markersize=3)

    plt.xticks(range(-11, 4))
    # plt.yticks(fontsize=15.5)
    plt.xlabel("offset", fontsize=37.5)
    plt.ylabel("error", fontsize=37.5)
    # ax.set_xlim(0, n + 0.1)
    # ax.set_ylim(0, 1.5)

    plt.savefig(outfile, format='png')

