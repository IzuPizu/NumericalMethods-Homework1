function [Link] = get_link_matrix(Labyrinth)
    [nrows, ncols] = size(Labyrinth);

    %Add WIN and LOSE states
    N = nrows * ncols + 2;
    %Get adjacency matrix
    Adj = get_adjacency_matrix(Labyrinth);
    %Initialize Link matrix
    Link = sparse(N, N);

    % Calculate row sums of adjacency matrix
    row_sums = sum(Adj, 2);

    % Fill link matrix
    for i = 1:N
        Link(i, :) = Adj(i, :) / row_sums(i);
    endfor

endfunction
