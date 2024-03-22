% Parameters
w_0 = 10;     % angular frequency of free oscillation
b = 0.1;      % damped coefficient
F = 10;       % stimulating force
w_values = [10.0, 5.0, 3.0, 0.0];  % different values of stimulating force angular frequency
t_end = 150;  % total time for simulation

% Generate time values
t_values = linspace(0, t_end, 1000);

% Initialize a cell array to store solutions for each value of w
solutions = cell(1, length(w_values));

% Loop over different values of w
for i = 1:length(w_values)
    w = w_values(i);
    
    % Define the differential equation
    syms t y(t)
    ode = diff(y, t, t) + 2*b*diff(y, t) + w_0^2*y - F*cos(w*t) == 0;

    % Initial conditions
    initial_conditions = [y(0) == 5, subs(diff(y, t), t, 0) == 0];

    % Solve the differential equation
    solutions{i} = dsolve(ode, initial_conditions);

    % Evaluate the solution for each time point
    y_values = subs(solutions{i}, t, t_values);

    % Plot the graph for each value of w on the same figure
    hold on;
    plot(t_values, y_values, 'DisplayName', ['\omega = ' num2str(w)]);
end

% Add legend and labels
legend('show');
xlabel('Time (s)');
ylabel('Displacement (y)');
title('Stimulated Oscillation for Different \omega Values');
grid on;
hold off;
