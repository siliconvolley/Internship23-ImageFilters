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

combinedMatrix = [];
combinedMatrixSize = length(matrixA)*2;
i = 2
while i <= combinedMatrixSize
    combinedMatrix(i-1,:) = matrixA(i-1,:);
    combinedMatrix(i,:) = matrixB(i-1,:); 
    i = i + 2;
end

combinedMatrix