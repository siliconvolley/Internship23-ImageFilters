% Access different parts of the matrix
matrix = [
    1, 2, 3;
    4, 5, 6;
    7, 8, 9
];

matrix
% Inputs for row and column indices
row_index = input('Enter the row index: ');
column_index = input('Enter the column index: ');

if 0 <= row_index && row_index < size(matrix, 1) && 0 <= column_index && column_index < size(matrix, 2)
    % Access the element at a given indices
    element = matrix(row_index, column_index);
    fprintf('Element at row %d and column %d is: %d\n', row_index, column_index, element);
else
    disp('Invalid indices. Please enter valid row and column indices.');
end

% Access a given row
row_index = input('Enter the row index: ');
row = matrix(row_index, :); % MATLAB uses 1-based indexing
disp(row);

% Access a given column
column_index = input('Enter the column index: ');
column = matrix(:, column_index); % MATLAB uses 1-based indexing
disp(column);
