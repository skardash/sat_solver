function anew = assign_new(a, poss, uniq_possible_sq, uniq_possible_row, uniq_possible_col)
    anew = a;
    for i=1:size(poss,1)
        for j=1:size(poss,2)
            if length(poss{i,j}) == 1
                disp('assignment: poss is uniq');
                anew(i,j) = poss{i,j}; continue;
            end
            if length(uniq_possible_sq{i,j}) == 1
                disp('assignment: poss_sq is uniq');
                anew(i,j) = uniq_possible_sq{i,j}; continue;
            end
            if length(uniq_possible_row{i,j}) == 1
                disp('assignment: poss_row is uniq');
                anew(i,j) = uniq_possible_row{i,j}; continue;
            end
            if length(uniq_possible_col{i,j}) == 1
                disp('assignment: poss_col is uniq');
                anew(i,j) = uniq_possible_col{i,j}; continue;
            end
        end
    end
end