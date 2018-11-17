clear
clc

%figure
x = 2.^[0:1:10];
y = 1./x.^2;
%plot(x, y, '*-');

figure
xx = log(x)/log(10);
yy = log(y)/log(10);
plot(xx, yy, '*-');
xticks([0, 1, 2, 3])
xticklabels({'10^0','10^1','10^2','10^3'})
yticks([-3, -2, -1, 0])
yticklabels({'10^{-3}','10^{-2}','10^{-1}','10^{0}'})

