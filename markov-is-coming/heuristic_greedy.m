function [path] = heuristic_greedy(start_position, probabilities, Adj)
    % Initialize path
    path = [start_position];
    % Initialize visited array
    visited = zeros(1, length(probabilities));
    visited(start_position) = 1;

    % While path is not empty
    while ~isempty(path)
        %  current position
        position = path(end);

        % if current position is the WIN state
        if position == length(probabilities) - 1
            return;
        end

        % Get unvisited neighbors
        neighbors = find(Adj(position, :));
        unvisited_neighbors = neighbors(~visited(neighbors));
        % If  no unvisited neighbors-> remove current position
        if isempty(unvisited_neighbors)
            path = path(1:end - 1);
        else
            % Add unvisited neighbor with greatest probability to reach WIN
            [~, max_prob_neighbor] = max(probabilities(unvisited_neighbors));
            visited(unvisited_neighbors(max_prob_neighbor)) = 1;
            path = [path, unvisited_neighbors(max_prob_neighbor)];
        endif

    endwhile

    % If no path to WIN , return empty path
    path = [];
endfunction
