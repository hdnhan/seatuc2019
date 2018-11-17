clear;clc;

err_t = [2	4	8	16	32	64	128	256	512
0.321369	0.0982261	0.0373951	0.0225755	0.0190623	0.0182093	0.0179981	0.0179454	0.0179322
0.208343	0.0557345	0.016996	0.00731414	0.00490785	0.00430993	0.00416085	0.00412361	0.0041143
0.00329917	0.00100839	0.000383897	0.00023176	0.000195693	0.000186936	0.000184768	0.000184227	0.000184092
];


x_t = log(0.1./err_t(1,:))/log(10);
q_t = log(err_t(2,:))/log(10);
u_t = log(err_t(3,:))/log(10);
z_t = log(err_t(4,:))/log(10);


t2=(0.5*err_t(2,1)+err_t(3,1)+err_t(4,1))/3;

for i =2:size(q_t,2)-2
    t2=[t2, t2(i-1)/4];
end 
t2 = log(t2)/log(10);

figure
hold on
plot(x_t, q_t, 'k*-', 'MarkerSize', 4)
plot(x_t, u_t, 'ro-', 'MarkerSize', 4)
plot(x_t, z_t, 'b>-', 'MarkerSize', 4)
plot(x_t(1:size(t2,2)), t2, '--');

xticks([-4, -3, -2, -1, 0])
xticklabels({'10^{-4}','10^{-3}','10^{-2}','10^{-1}','10^{0}'})
yticks([-4, -3, -2, -1, 0])
yticklabels({'10^{-4}','10^{-3}','10^{-2}','10^{-1}','10^{0}'})
box on
xlabel('\Delta t')
legend('||q-q_h||_{L^2(Q)}', '||u-u_h||_{L^2(Q)}', '||z-z_h||_{L^2(Q)}', 'O(\Delta t^2)', 'Location', 'northwest');
pbaspect([3 4 1])
saveas(gcf, 'err_t.png');



err_x = [2.10069	0.942464	0.273516	0.0710288	0.0179289
0.571099	0.22663	0.0634405	0.016326	0.00411198
0.0215657	0.00967532	0.00280791	0.00072918	0.000184058
];

n = 2;
x_x = [];
for i=1:size(err_x, 2)
    x_x = [x_x, 1/(n*2^(i-1)*sqrt(2))];
end

x_x = log(x_x)/log(10);
q_x = log(err_x(1,:))/log(10);
u_x = log(err_x(2,:))/log(10);
z_x = log(err_x(3,:))/log(10);

x2=(0.5*err_x(1,1)+0.5*err_x(2,1)+err_x(3,1))/3;
for i =2:size(q_x,2)
    x2=[x2, x2(i-1)/4];
end 
x2 = log(x2)/log(10);


figure
hold on
plot(x_x, q_x, 'k*-', 'MarkerSize', 4)
plot(x_x, u_x, 'ro-', 'MarkerSize', 4)
plot(x_x, z_x, 'b>-', 'MarkerSize', 4)
plot(x_x(1:size(x2,2)), x2, '--');

xticks([-2, -1, 0])
xticklabels({'10^{-2}','10^{-1}','10^{0}'})
ylim([-4, 1])
%ax = gca;
%ax.YAxisLocation = 'right';
yticks([-4, -3, -2, -1, 0, 1])
yticklabels({'10^{-4}','10^{-3}','10^{-2}','10^{-1}','10^{0}','10^{1}'})
box on
xlabel('h')
legend('||q-q_h||_{L^2(Q)}', '||u-u_h||_{L^2(Q)}', '||z-z_h||_{L^2(Q)}', 'O(h^2)', 'Location', 'northwest');
pbaspect([3 4 1])
saveas(gcf, 'err_x.png');

