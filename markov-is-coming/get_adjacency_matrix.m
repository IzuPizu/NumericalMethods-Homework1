function [Adj] = get_adjacency_matrix(Labyrinth)
    %Get dimensions
    [nrows, ncols] = size(Labyrinth);
    N = nrows * ncols + 2;
    %Initialize matrix as sparse matrix
    Adj = sparse(N, N);

    for i = 1:nrows

        for j = 1:ncols
            %compute index
            index = (i - 1) * ncols + j;

            if bitget(Labyrinth(i, j), 4) == 0 && i == 1 %WIN STATE NORTH
                Adj(index, N - 1) = 1;
            endif

            if bitget(Labyrinth(i, j), 3) == 0 && i == nrows %WIN STATE SOUTH
                Adj(index, N - 1) = 1;
            endif

            if bitget(Labyrinth(i, j), 2) == 0 && j == ncols %LOSE STATE EAST
                Adj(index, N) = 1;
            endif

            if bitget(Labyrinth(i, j), 1) == 0 && j == 1 %LOSE STATE WEST
                Adj(index, N) = 1;
            endif

            if bitget(Labyrinth(i, j), 4) == 0 && i > 1 %NORTH wall
                Adj(index, index - ncols) = 1;
                Adj(index - ncols, index) = 1;
            end

            if bitget(Labyrinth(i, j), 3) == 0 && i < nrows %SOUTH wall
                Adj(index, index + ncols) = 1;
                Adj(index + ncols, index) = 1;
            end

            if bitget(Labyrinth(i, j), 2) == 0 && j < ncols %EAST wall
                Adj(index, index + 1) = 1;
                Adj(index + 1, index) = 1;
            end

            if bitget(Labyrinth(i, j), 1) == 0 && j > 1 %WEST wall
                Adj(index, index - 1) = 1;
                Adj(index - 1, index) = 1;
            end

        endfor

    endfor

    %WIN TO WIN STATE
    Adj(N - 1, N - 1) = 1;
    %LOSE TO LOSE STATE
    Adj(N, N) = 1;

endfunction
