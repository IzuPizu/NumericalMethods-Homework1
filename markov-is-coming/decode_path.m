function [decoded_path] = decode_path(path, lines, cols)

    % Initialize marix
    decoded_path = zeros(length(path), 2);

    % Compute row and col pair
    for i = 1:length(path)
        row = ceil(path(i) / cols);
        col = mod(path(i) - 1, cols) + 1;
        decoded_path(i, :) = [row, col];
    endfor

    decoded_path(end, :) = [];
endfunction
