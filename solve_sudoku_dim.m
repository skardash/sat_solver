function [a,err,solved] = solve_sudoku_dim(a,dim)
    aold = zeros(size(a));
    steps = 1;
    err = 0; solved = 0;
    while (any(aold(:) ~= a(:)) && ~err)
        aold = a;
        poss = generate_possible_dim(a,dim);
        noposs = cellsize(poss) == 0;
        err = any(noposs(:) & (a(:) == 0));
        if err 
            find(noposs(:) & (a(:) == 0))
            return;
        end
        [uniq_possible_sq, uniq_possible_row, uniq_possible_col] = generate_unique_dim(poss,dim);
        a = assign_new(a, poss, uniq_possible_sq, uniq_possible_row, uniq_possible_col);
        steps = steps + 1;
    end
    if (all(a))
        solved = true;
    else 
        sz = cellsize(poss);
        sz(sz == 0) = 9;
        [C,I] = min(sz);
        [S,J] = min(C);
        ix = [I(J) J];
        cnt = 1;
        while (~solved && cnt<S+1)
            anew = a;
            anew(ix(1),ix(2)) = poss{ix(1),ix(2)}(cnt);
            % disp('branch: assumption made');
            [anew,err,solved] = solve_sudoku_dim(anew,dim);
            cnt = cnt+1;
        end
        if solved
            a = anew;
        end
    end
end