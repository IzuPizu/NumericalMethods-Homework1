function [G, c] = get_Jacobi_parameters (Link)
    [nrows, ncols] = size(Link);

    %Initialize iteration matrix G
    G = sparse(nrows - 2, ncols - 2);

    %Get G matrix from Link matrix
    for i = 1:(nrows - 2)

        for j = 1:(ncols - 2)
            G(i, j) = Link(i, j);
        endfor

    endfor

    %Get iteration vector from Link matrix
    c1 = Link(1:nrows - 2, ncols - 1);
    c = sparse(c1);

endfunction
