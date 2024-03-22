% Define the symbolic variables
syms t y(t)
w0 = 3; % Angular frequency of free oscillation

% Define the differential equation
ode = diff(y, t, t) + w0^2 * y == 0;

% Set initial conditions
initial_conditions = [y(0) == 5, subs(diff(y, t), t, 0) == 0];

% Solve the differential equation using dsolve
solution = dsolve(ode, initial_conditions);

% Generate time values
t_values = 0:0.01:20;

% Evaluate the solution for each time point
y_values = subs(solution, t, t_values);

% Plot the graph
figure;
plot(t_values, y_values);
title('Harmonic Oscillation (Symbolic Solution)');
xlabel('Time (s)');
ylabel('Displacement (y)');
grid on;
