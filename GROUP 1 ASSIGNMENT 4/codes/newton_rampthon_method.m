% Newton-Raphson Method using Recursive Programming
clc; clear;

f  = @(x) 2.^x - 5.*x + 2;                 % function
df = @(x) log(2).*2.^x - 5;                % derivative

% Main recursive function
function [root, converged] = newton_raphson_recursive(x, tol, maxIter, currentIter, f, df)
    if currentIter > maxIter
        fprintf('Maximum iterations reached without convergence.\n');
        root = x;
        converged = false;
        return;
    end
    
    % Calculate new approximation
    x_new = x - f(x)/df(x);
    
    % Print iteration info
    fprintf('%d\t %.6f\t %.6f\n', currentIter, x_new, f(x_new));
    
    % Check convergence
    if abs(x_new - x) < tol
        fprintf('\nRoot ≈ %.4f (to 4 d.p.)\n', x_new);
        root = x_new;
        converged = true;
    else
        % Recursive call with updated values
        [root, converged] = newton_raphson_recursive(x_new, tol, maxIter, currentIter + 1, f, df);
    end
end

% Initial parameters
x0 = 0.5; tol = 1e-4; maxIter = 50;

fprintf('Newton-Raphson Method Iterations (Recursive):\n');
fprintf('Iter\t x_n\t\t f(x_n)\n');

% Call recursive function
[root, converged] = newton_raphson_recursive(x0, tol, maxIter, 1, f, df);

% Plot function and root
xVals = -2:0.01:3;
plot(xVals, f(xVals), 'b-', 'LineWidth', 2); hold on;
yline(0, 'k--'); plot(root, f(root), 'ro','MarkerSize',8,'MarkerFaceColor','r');
xlabel('x'); ylabel('f(x)'); grid on;
title('Newton-Raphson (Recursive): f(x) = 2^x - 5x + 2');
legend('f(x)','y=0','Root');
