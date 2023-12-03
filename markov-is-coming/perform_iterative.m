function [x, err, steps] = perform_iterative(G, c, x0, tol, max_steps)
    % Initialize variables
    x = x0;
    err = tol + 1;
    steps = 0;

    % Perform iterative Jacobi method 
    while err > tol && steps < max_steps
        x_new = G * x + c;
        err = norm(x_new - x);
        x = x_new;
        steps = steps + 1;
    endwhile

endfunction
