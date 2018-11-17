clear;clc;

err_t = [2	4	8	16	32	64	128	256	512
0.321369	0.0982261	0.0373951	0.0225755	0.0190623	0.0182093	0.0179981	0.0179454	0.0179322
0.208343	0.0557345	0.016996	0.00731414	0.00490785	0.00430993	0.00416085	0.00412361	0.0041143
0.00329917	0.00100839	0.000383897	0.00023176	0.000195693	0.000186936	0.000184768	0.000184227	0.000184092
];

x_t = log(err_t(1,:))/log(10);
q_t = log(err_t(2,:))/log(10);
u_t = log(err_t(3,:))/log(10);
z_t = log(err_t(4,:))/log(10);

figure
hold on
plot(x_t, q_t, 'k*-', 'MarkerSize', 4)
plot(x_t, u_t, 'ro-', 'MarkerSize', 4)
plot(x_t, z_t, 'b>-', 'MarkerSize', 4)
xticks([0, 1, 2, 3])
xticklabels({'10^0','10^1','10^2','10^3'})
yticks([-4, -3, -2, -1, 0])
yticklabels({'10^{-4}','10^{-3}','10^{-2}','10^{-1}','10^{0}'})
box on
xlabel('M')
legend('||q-q_h||_{L^2(Q)}', '||u-u_h||_{L^2(Q)}', '||z-z_h||_{L^2(Q)}');
pbaspect([5 6 1])
saveas(gcf, 'err_t.png');



err_x = [2.10069	0.942463	0.273515
0.571098	0.226629	0.0634399
0.0215656	0.00967531	0.0028079
];

n = 2;
x_x = [];
for i=1:size(err_x, 2)
    x_x = [x_x, (n*2^(i-1)+1)^2];
end

x_x = log(x_x)/log(10);
q_x = log(err_x(1,:))/log(10);
u_x = log(err_x(2,:))/log(10);
z_x = log(err_x(3,:))/log(10);


figure
hold on
plot(x_x, q_x, 'k*-', 'MarkerSize', 4)
plot(x_x, u_x, 'ro-', 'MarkerSize', 4)
plot(x_x, z_x, 'b>-', 'MarkerSize', 4)
xticks([0, 1, 2, 3])
xticklabels({'10^0','10^1','10^2','10^3'})
ylim([-3, 1])
yticks([-4, -3, -2, -1, 0, 1])
yticklabels({'10^{-4}','10^{-3}','10^{-2}','10^{-1}','10^{0}','10^{1}'})
box on
xlabel('N')
legend('||q-q_h||_{L^2(Q)}', '||u-u_h||_{L^2(Q)}', '||z-z_h||_{L^2(Q)}');
pbaspect([5 6 1])
saveas(gcf, 'err_x.png');
