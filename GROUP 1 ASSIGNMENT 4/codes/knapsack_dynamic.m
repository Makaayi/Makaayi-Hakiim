function[max_value, selected_items] = solveSimpleKnapsackWithItems(W, wt, val)
    % Dynamic Programming solution for 0/1 Knapsack problem
    % Returns maximum value and list of selected item indices
    
    n = length(wt);
    
    % Initialize DP table
    dp = zeros(n + 1, W + 1);
    
    % Fill DP table
    for i = 1:n
        for current_capacity = 0:W
            if wt(i) <= current_capacity
                % Item can be included - choose maximum value option
                include_value = val(i) + dp(i, current_capacity - wt(i) + 1);
                exclude_value = dp(i, current_capacity + 1);
                dp(i + 1, current_capacity + 1) = max(include_value, exclude_value);
            else
                % Item too heavy - must exclude
                dp(i + 1, current_capacity + 1) = dp(i, current_capacity + 1);
            end
        end
    end
    
    max_value = dp(n + 1, W + 1);
    
    % Determine which items were selected
    selected_items = [];
    remaining_capacity = W;
    
    % Trace back through the DP table
    for item_index = n:-1:1
        if dp(item_index + 1, remaining_capacity + 1) ~= dp(item_index, remaining_capacity + 1)
            % This item was included in the optimal solution
            selected_items = [item_index, selected_items];
            remaining_capacity = remaining_capacity - wt(item_index);
        end
    end
end

% Test the function
fprintf('Knapsack Problem Solution\n');
fprintf('=========================\n');

W = 5;
wt = [2, 3, 4, 5];
val = [3, 4, 5, 6];

[max_val, selected_items] = solveSimpleKnapsackWithItems(W, wt, val);

fprintf('Knapsack capacity: %d\n', W);
fprintf('Item weights: [%s]\n', num2str(wt));
fprintf('Item values:  [%s]\n', num2str(val));
fprintf('\n');
fprintf('Maximum value: %d\n', max_val);
fprintf('Selected items (indices): [%s]\n', num2str(selected_items));
fprintf('Selected weights: [%s]\n', num2str(wt(selected_items)));
fprintf('Selected values: [%s]\n', num2str(val(selected_items)));
fprintf('Total weight used: %d\n', sum(wt(selected_items)));

% Additional verification
if ~isempty(selected_items)
    fprintf('Verification - Total weight: %d (<= capacity: %d)\n', ...
            sum(wt(selected_items)), W);
    fprintf('Verification - Total value: %d\n', sum(val(selected_items)));
end