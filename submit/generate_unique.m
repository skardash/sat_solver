function [uniq_possible_sq, uniq_possible_row, uniq_possible_col] = generate_unique(poss,dim)
    uniq_possible_sq = poss;
    uniq_possible_row = poss;
    uniq_possible_col = poss;
    for i = 1:size(poss,1)
        for j = 1:size(poss,2)
            i_low = fix((i-1)/dim(1))*dim(1); i_range = i_low + 1:fix((i-1)/dim(1))*dim(1) + dim(1); 
            j_low = fix((j-1)/dim(2))*dim(2); j_range = j_low + 1:fix((j-1)/dim(2))*dim(2) + dim(2);

            cell_range = poss(i_range,j_range);
            %{
            i
            i_low
            j
            j_low
            %}
            cell_range{i - i_low, j - j_low} = [];
            cell_range = cell_range(:);
            unioned = [];
            for cnt = 1:size(cell_range, 1)
                unioned = union(unioned, cell_range{cnt});
            end
            %to_fill(i_range,j_range)
            uniq_possible_sq{i,j} = setdiff(poss{i,j},unioned);
            %poss{find(to_fill)}

            cell_range = poss(i,:);
            cell_range{1, j} = [];
            unioned = [];
            for cnt = 1:size(cell_range, 2)
                unioned = union(unioned, cell_range{cnt});
            end
            %to_fill(i_range,j_range)
            if (i==8 & j==9)
                %a = 1;
            end
            uniq_possible_row{i,j} = setdiff(poss{i,j}, unioned);

            cell_range = poss(:,j);
            cell_range{i, 1} = [];
            unioned = [];
            for cnt = 1:size(cell_range, 1)
                unioned = union(unioned, cell_range{cnt});
            end
            %to_fill(i_range,j_range)
            if (i==8 & j==9)
                %a = 1;
            end
            uniq_possible_col{i,j} = setdiff(poss{i,j}, unioned);
        end 
    end
end