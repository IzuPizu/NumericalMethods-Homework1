function [Labyrinth] = parse_labyrinth(file_path)
    % file_path -> the relative path to a file that needs to
    %be loaded_graphics_toolkits
    % Labyrinth -> the matrix of all encodings for the labyrinth's walls

    %Open filepath for reading
    file = fopen(file_path, 'r');

    % Read num of rows and columns from file
    m = fscanf(file, '%d', 1);
    n = fscanf(file, '%d', 1);
    % Initialize a cell-array
    Labyrinth_str = cell(m, n);
    % Initialize Labyrinth
    Labyrinth = zeros(m, n);

    % Read elements from file and convert to 4-bit representation
    % and store them in cell array
    for i = 1:m

        for j = 1:n
            element = fscanf(file, '%d', 1);
            Labyrinth_str{i, j} = dec2bin(element, 4);

        endfor

    endfor
    
    %Fill Labyrinth matrix with the decimal form 
    for i = 1:m

        for j = 1:n
            Labyrinth(i, j) = bin2dec(Labyrinth_str{i, j});
        endfor

    endfor

    % Close file
    fclose(file);

endfunction
