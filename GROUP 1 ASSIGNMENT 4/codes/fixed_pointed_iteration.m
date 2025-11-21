%Defining the recursive function 
function root = fixed_recursive(xO, e, n, iter)
   if nargin < 4
       iter = 0;
   end

   if iter >= n
       root = xO;
       return;
   end

   x1 = (2^xO + 2)/5;

   if abs(x1-xO) < e
    root = x1;
    return;
   end

   root = fixed_recursive(x1,e,n,iter+1);
end

%input data
g = @ (x) (2^x + 2)/5;
xO = 0;
e = 0.0001;
n = 10;

%call recussive fixed point iteration method
fixed_point = fixed_recursive(xO,e,n);

fprintf('Root: %.4f\n',fixed_point);

% Store all iterations
all_iterations = [];
all_values = xO; 

% Start with initial guess
for i = 1:n
    x1 = g(xO);    

% Store each iteration
all_iterations = [all_iterations, i];
all_values = [all_values, x1];
    xO = x1;
end

% Plot all points
figure;
plot(0:n, all_values, 'bo-', 'LineWidth', 2, 'MarkerFaceColor', 'blue', 'MarkerSize', 6);
xlabel('Iteration Number');
ylabel('x value');
title('Fixed-Point Iteration Convergence');
grid on;