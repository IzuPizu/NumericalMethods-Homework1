function [Y, InitialMatrix] = parse_csv_file(file_path)
    % Open file
    fid = fopen(file_path);
    % Read data
    C = textscan(fid, '%s', 'delimiter', '\n');

    % Get header from file
    header = C{1}{1};
    column_names = strsplit(header, ',');
    % Get data lines
    data_lines = C{1}(2:end);

    % Initialize matrix and array
    InitialMatrix = cell(length(data_lines), length(column_names) - 1);
    Y = zeros(length(data_lines), 1);

    % Fill InitialMatrix and Y array
    for i = 1:length(data_lines)
        line = strsplit(data_lines{i}, ',');
        Y(i) = str2double(line{1});

        for j = 2:length(column_names)

            if strcmp(line{j}, 'yes')
                InitialMatrix{i, j - 1} = 'yes';
            elseif strcmp(line{j}, 'semi-furnished')
                InitialMatrix{i, j - 1} = 'semi-furnished';
            elseif strcmp(line{j}, 'no')
                InitialMatrix{i, j - 1} = 'no';
            elseif strcmp(line{j}, 'furnished')
                InitialMatrix{i, j - 1} = 'furnished';
            elseif strcmp(line{j}, 'unfurnished')
                InitialMatrix{i, j - 1} = 'unfurnished';
            else
                InitialMatrix{i, j - 1} = str2double(line{j});
            endif

        endfor

    endfor

    %Close file
    fclose(fid);
endfunction
