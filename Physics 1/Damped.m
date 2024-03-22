% Parameters
w_0 = 10;    % angular frequency of free oscillation
F = 0;       % stimulating force
t_end = 20;  % total time for simulation
b_values = [0.01, 0.1, 1.0, 10.0];  % different values of b

% Generate time values
t_values = linspace(0, t_end, 1000);

% Initialize a cell array to store solutions for each b
solutions = cell(1, length(b_values));

% Loop over different values of b
for i = 1:length(b_values)
    b = b_values(i);
    
    % Define the differential equation
    syms t y(t)
    ode = diff(y, t, t) + b*diff(y, t) + w_0^2*y - F*cos(w_0*t) == 0;

    % Initial conditions
    initial_conditions = [y(0) == 5, subs(diff(y, t), t, 0) == 0];

    % Solve the differential equation
    solutions{i} = dsolve(ode, initial_conditions);

    % Evaluate the solution for each time point
    y_values = subs(solutions{i}, t, t_values);

    % Plot the graph for each value of b on the same figure
    hold on;
    plot(t_values, y_values, 'DisplayName', ['b = ' num2str(b)]);
end

% Add legend and labels
legend('show');
xlabel('Time (s)');
ylabel('Displacement (y)');
title('Damped Oscillation for Different b Values');
grid on;
hold off;
