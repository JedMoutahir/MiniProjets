from mpl_toolkits import mplot3d
import matplotlib.pyplot as plt
import numpy as np


def trajectory(velocity, angle1, angle2, t) :
    return [velocity*np.cos(angle1)*np.cos(angle2)*t, velocity*np.cos(angle1)*np.sin(angle2)*t, max(0, velocity*np.sin(angle1)*t - (9.81*t*t)/2)]


vel = np.random.random_sample()*15
a1 = np.random.random_sample()*np.pi/2
a2 = np.random.random_sample()*np.pi/2
N = 1000
T = 5.0

X = []
Y = []
Z = []

for i in range(N) :
    X.append(trajectory(vel, a1, a2, i*T/N)[0])
    Y.append(trajectory(vel, a1, a2, i*T/N)[1])
    Z.append(trajectory(vel, a1, a2, i*T/N)[2])
# print(X, Z)
ax = plt.axes(projection='3d')
# ax.set_aspect('equal')
ax.plot3D(X, Y, Z)

plt.show()