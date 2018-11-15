clear
clc
format shortE

formatSpec = '%f';
fileID = fopen('CrankN.txt', 'r');
fh = vec2mat(fscanf(fileID, formatSpec), 8);
fh