a = csvread('sud7_changed.txt');
dim = [3,3]; % size of single element
[a,err,solved] = solve_sudoku(a,dim);