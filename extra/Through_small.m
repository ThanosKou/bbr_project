clear; close all;

x = load('t_cubic.txt') ;
y = load('t_bbr.txt') ;

x = x(1:20) ; % experiment duration is 20 sec
y = y(1:20) ;

figure; 
plot(1:length(x), x)
hold on
plot(1:length(y), y)

xlim([0 length(x)])
ylim([5 15])
legend('CUBIC','BBR')
xlabel('time (sec)')
ylabel('Throughput (Mbps)')
title(' Throughput for small buffer sizes')
print -dpdf small
