function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
    % Read dimensions
    [rows, cols] = size(InitialMatrix);
    % Initialize Matrix
    FeatureMatrix = zeros(rows, cols + 1);

    % Construct FeatureMatrix with corresponding numeric types
    for i = 1:rows

        for j = 1:cols

            if strcmp(InitialMatrix{i, j}, 'yes')
                FeatureMatrix(i, j) = 1;
            elseif strcmp(InitialMatrix{i, j}, 'no')
                FeatureMatrix(i, j) = 0;
            elseif strcmp(InitialMatrix{i, j}, 'semi-furnished')
                FeatureMatrix(i, j) = 1;
                FeatureMatrix(i, cols + 1) = 0;
            elseif strcmp(InitialMatrix{i, j}, 'unfurnished')
                FeatureMatrix(i, j) = 0;
                FeatureMatrix(i, cols + 1) = 1;
            elseif strcmp(InitialMatrix{i, j}, 'furnished')
                FeatureMatrix(i, j) = 0;
                FeatureMatrix(i, cols + 1) = 0;
            else
                FeatureMatrix(i, j) = InitialMatrix{i, j};
            endif

        endfor

    endfor

endfunction
