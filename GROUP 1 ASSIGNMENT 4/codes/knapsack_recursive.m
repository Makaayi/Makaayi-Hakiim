function max_value = solveSimpleKnapsack(W, wt, val)
    % Knapsack Problem: Recursive with Memoization using nested functions
    
    n = length(wt);
    
    % Initialize memoization table as persistent within this function
    memo = -ones(n + 1, W + 1);
    
    % Define nested function that can access and modify memo
    function result = knapsack(i, w)
        % Base case: no items left or no capacity
        if i == 0 || w == 0
            result = 0;
            return;
        end
        
        % Check if result already computed
        if memo(i, w) ~= -1
            result = memo(i, w);
            return;
        end
        
        % Get current item details
        current_weight = wt(i);
        current_value = val(i);
        
        if current_weight > w
            % Item too heavy - exclude it
            result = knapsack(i - 1, w);
        else
            % Compare including vs excluding the item
            val_exclude = knapsack(i - 1, w);
            val_include = current_value + knapsack(i - 1, w - current_weight);
            
            result = max(val_exclude, val_include);
        end
        
        % Store result in memoization table
        memo(i, w) = result;
    end
    
    % Call the nested function
    max_value = knapsack(n, W);
end

% Test the function
W = 5;
wt = [2, 3, 4, 5];
val = [3, 4, 5, 6];

result = solveSimpleKnapsack(W, wt, val);
disp(['Maximum Value: ', num2str(result)]);

% Expected output: Maximum Value: 7
% (Items 1 and 2: weight 2+3=5, value 3+4=7)