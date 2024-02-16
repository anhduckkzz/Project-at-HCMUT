import numpy as np
import matplotlib.pyplot as plt

def p(x, r):
    return x**5 - (2 + r)*x**4 + (1 + 2*r)*x**3 - (1 - r)*x**2 + 2*(1 - r)*x + r - 1

def p_prime(x, r):
    return 5*x**4 - 4*(2 + r)*x**3 + 3*(1 + 2*r)*x**2 - 2*(1 - r)*x + 2*(1 - r)

r_value = 3.04042e-6

x_values = np.linspace(0.985, 0.992, 400) 

y_values = p(x_values, r_value)

tangent_points = [0.9861, 0.9890]

plt.plot(x_values, y_values, label=f'p(x) for r = {r_value}')

for x_tangent in tangent_points:
    y_tangent = p(x_tangent, r_value)
    slope_tangent = p_prime(x_tangent, r_value)

    tangent_line = lambda x: slope_tangent * (x - x_tangent) + y_tangent
    plt.plot(x_values, tangent_line(x_values), label=f'Tangent at x = {x_tangent:.4f}')

plt.axhline(0, color='black', linewidth=0.5, linestyle='--')

plt.title('x^5 - (2 + r)x^4 + (1 + 2r)x^3 − (1 - r)x^2 + 2(1 - r)x + r - 1 = 0')
plt.xlabel('x')
plt.ylabel('p(x)')
plt.legend()
plt.grid(True)
plt.show()