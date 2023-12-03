function [Y, InitialMatrix] = parse_data_set_file(file_path)
    %Open file for reading
    fid = fopen(file_path, 'r');

    if fid == -1
        error('Failed to open file.');
    end

    % Read dimensions
    dim = fscanf(fid, '%d', 2);
    m = dim(1);
    n = dim(2);

    % Initialize cell array
    InitialMatrix = cell(m, n + 1);

    % Read data into cell array
    for i = 1:m
        row_data = textscan(fid, '%s', n + 1);
        InitialMatrix(i, :) = row_data{1}';
    endfor

    % Initialize Y with first column of the array
    % and convert to correct type
    Y = cellfun(@(x) str2double(x), InitialMatrix(:, 1));
    % Remove first column to get final matrix
    InitialMatrix(:, 1) = [];

    fclose(fid);
endfunction
