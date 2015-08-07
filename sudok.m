a = csvread('sud.txt');
[a,err,solved] = solve_sudoku_dim(a,[3,3]);