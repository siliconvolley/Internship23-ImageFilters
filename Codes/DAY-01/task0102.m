% To perform matrix operations
matrixA = [
    1, 8, 17;
    16, 85, 90;
    100, 67, 78
];

matrixB = [
    4, 56, 14;
    20, 80, 78;
    50, 34, 9
];

% To combine 2 matrices
combinedMatrix = [];
i = 1;
while i <= length(matrixA)
    combinedMatrix(i*2, :) = matrixB(i, :);
    combinedMatrix(i*2-1, :) = matrixA(i, :);
    i = i + 1;
end
combinedMatrix

% To transpose a matrix
transposedMatrix = combinedMatrix';
transposedMatrix

% Array multiplication
arrayProduct = [];
for i = 1: length(matrixA)
    for j = 1: length(matrixB)
        arrayProduct(i, j) = matrixA(i, j) * matrixB(i, j);
    end
end
arrayProduct

% Matrix multiplication
matrixProduct = matrixA*matrixB;
matrixProduct

% Array division
arrayDivision = [];
for i = 1: length(matrixA)
    for j = 1: length(matrixB)
        arrayDivision(i, j) = matrixA(i, j) / matrixB(i, j);
    end
end
arrayDivision
