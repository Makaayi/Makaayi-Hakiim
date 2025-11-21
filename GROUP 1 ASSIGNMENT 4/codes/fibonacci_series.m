% Clear workspace and command window
clear; clc;

% Define range of Fibonacci indices
n_values = 5:35;
recursive_times = zeros(size(n_values));
dynamic_times = zeros(size(n_values));

% Naive recursive Fibonacci function
function f = fib_recursive(n)
    if n <= 1
        f = n;
    else
        f = fib_recursive(n - 1) + fib_recursive(n - 2);
    end
end

% Dynamic programming Fibonacci function
function f = fib_dynamic(n)
    if n <= 1
        f = n;
        return;
    end
    fibs = zeros(1, n + 1);
    fibs(1) = 0;
    fibs(2) = 1;
    for i = 3:n + 1
        fibs(i) = fibs(i - 1) + fibs(i - 2);
    end
    f = fibs(n + 1);
end

% Measure computation times
for i = 1:length(n_values)
    n = n_values(i);

    % Time recursive method
    tic;
    fib_recursive(n);
    recursive_times(i) = toc * 1000; 

    % Time dynamic method
    tic;
    fib_dynamic(n);
    dynamic_times(i) = toc * 1000;
end

% Plotting the results
figure;
plot(n_values, recursive_times, 'b-o', 'LineWidth', 1.5);
hold on;
plot(n_values, dynamic_times, 'g-s', 'LineWidth', 1.5);
xlabel('Fibonacci Index (n)');
ylabel('Computation Time (ms)');
title('Fibonacci Computation Time: Recursive vs Dynamic Programming');
legend('Recursive', 'Dynamic Programming');
grid on;
