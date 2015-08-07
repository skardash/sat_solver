function poss = generate_possible(a)
    var = 1:9;
    poss = cell(size(a));
    for i = 1:size(a,1)
        for j = 1:size(a,2)
            i_range = fix((i-1)/3)*3+1:fix((i-1)/3)*3+3; 
            j_range = fix((j-1)/3)*3+1:fix((j-1)/3)*3+3;
            square = a(i_range,j_range);
            if (a(i,j) == 0)
                poss{i,j} = setdiff(var,union(a(i,:),union(a(:,j)',(square(:))')));
            end
        end 
    end
end