function [a,err,solved] = solve_sudoku(a,dim)
    aold = zeros(size(a));
    err = 0; solved = 0;
    steps = 1;
    while (any(aold(:) ~= a(:)) && ~err)
        aold = a;
        %generate possible values for each element
        poss = generate_possible(a,dim);
        noposs = cellfun(@length, poss) == 0;
        %in case there are no possible variants available and element is
        %still not filled we fix error and return
        err = any(noposs(:) & (a(:) == 0));
        if err 
            find(noposs(:) & (a(:) == 0))
            return;
        end
        % based on possible elements we find uniquely possible elements for
        % each element
        [uniq_possible_sq, uniq_possible_row, uniq_possible_col] = generate_unique(poss,dim);
        % we assign if there is single possible element or single uniquely
        % possible element for the cell
        a = assign_new(a, poss, uniq_possible_sq, uniq_possible_row, uniq_possible_col);
        steps = steps + 1;
    end
    if (all(a))
        % no zero elements, task is finished
        solved = true;
    else 
        % we can't fill the matrix anymore using algorithm described above
        % so we take the cell with smallest number of possible elements and
        % start bruteforce search from this space
        sz = cellfun(@length, poss);
        sz(sz == 0) = 9;
        [M,I] = min(sz(:));
        [I_row, I_col] = ind2sub(size(sz),I)
        ix = [I_row, I_col];
        cnt = 1;
        while (~solved && cnt<S+1)
            anew = a;
            anew(ix(1),ix(2)) = poss{ix(1),ix(2)}(cnt);
            [anew,err,solved] = solve_sudoku(anew,dim);
            cnt = cnt+1;
        end
        if solved
            % we finish our search in case task is solved
            a = anew;
        end
    end
end