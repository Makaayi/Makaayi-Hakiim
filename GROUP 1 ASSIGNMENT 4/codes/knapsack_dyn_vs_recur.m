% Knapsack computation time comparison
problem_sizes = [5, 10, 15, 20, 25];
recursive_times = [0.0012, 0.0087, 0.0456, 0.2341, 1.2345];
dp_times = [0.0001, 0.0002, 0.0004, 0.0007, 0.0012];
figure;
plot(problem_sizes, recursive_times, 'r-o', 'LineWidth', 2, 'MarkerSize', 6, 'DisplayName', 'Recursive');
hold on;
plot(problem_sizes, dp_times, 'b-s', 'LineWidth', 2, 'MarkerSize', 6, 'DisplayName', 'Dynamic Programming');
grid on;
xlabel('Number of Items');
ylabel('Computation Time (seconds)');
title('Knapsack: Recursive vs DP Time Comparison');
legend('Location', 'northwest');