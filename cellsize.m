function sz = cellsize(poss)
    sz = zeros(size(poss));
    for i = 1:size(poss,1)
        for j = 1:size(poss,2)
            sz(i,j) = length(poss{i,j});
        end
    end
end