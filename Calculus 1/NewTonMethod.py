# This code is for L1 of Topic 2

r = 3.04042e-6      
# r = m1/(m1+m2)
# m1 is the mass of the Sun
# m2 is the mass of the Earth
# The unit here is the distance
# between the centers of the earth and the sun, called an astronomical unit: 1AU ~ 1.496*10^8(km)

def f(x):       # f(x) is the equation we are applying the Newton method
    return x**5 - (2 + r)*x**4 + (1 + 2*r)*x**3 - (1 - r)*x**2 + 2*(1 - r)*x + r - 1

def g(x):       # g(x) is the derivative of f(x)
    return 5*x**4 - 4*(2 + r)*x**3 + 3*(1 + 2*r)*x**2 - 2*(1 - r)*x + 2*(1 - r)

def newtonRaphson(x0):
    print('\n\n*** NEWTON RAPHSON METHOD IMPLEMENTATION ***\n')
    i = 0       # just a value to increase the x value when finding the root (x1, x2, x3, x4, ...)
    while True:
        if g(x0) == 0.0:
            print('No solution')
            break
        x1 = x0 - f(x0)/g(x0)
        print(f"x{i} = {round(x1,6)}")
        i += 1      # Increase the value i by 1 
        # This function if below check if the difference between x1 and x0 is small enough to stop
        # BECAUSE the x value is always approach to the exact root, so that we just consider a small enough of delta x-> 0
    
        if abs(x1 - x0) < 1e-5:    
            print('\n')
            print(f'The answer root ~ {round(x1,6)}(AU)')
            break
        x0 = x1                    # Update the current x(x1) with the previous x(x0)

x0 = input('\n\nEnter your guess about x value : ')
x0 = float(x0)
newtonRaphson(x0)