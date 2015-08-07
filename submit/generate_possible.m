function poss = generate_possible(a,dim)
    var = 1:dim(1)*dim(2);
    poss = cell(size(a));
    for i = 1:size(a,1)
        for j = 1:size(a,2)
            i_range = fix((i-1)/dim(1))*dim(1)+1:fix((i-1)/dim(1))*dim(1)+dim(1); 
            j_range = fix((j-1)/dim(2))*dim(2)+1:fix((j-1)/dim(2))*dim(2)+dim(2);
            square = a(i_range,j_range);
            if (a(i,j) == 0)
                poss{i,j} = setdiff(var,union(a(i,:),union(a(:,j)',(square(:))')));
            end
        end 
    end
end