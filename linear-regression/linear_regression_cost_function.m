function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)

    % Training samples
    m = length(Y);

    % Add column of 1's to predictor matrix
    FeatureMatrix = [ones(m, 1), FeatureMatrix];

    % Calculate predictions
    Predict = FeatureMatrix * Theta;

    % Calculate error
    Error = (1 / (2 * m)) * sum((Predict - Y).^2);

endfunction
