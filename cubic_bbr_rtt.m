clear; close all ;

x = load('cubic_rtt.txt') ;
y = load('bbr_rtt.txt') ;

bbr = y(:,2) ;
t_bbr = y(:,1) ;

cubic = x(:,2) ;
t_cubic = x(:,1) ;

figure ;
plot(t_bbr,1000*bbr) 
hold on
plot(t_cubic,1000*cubic)
legend('BBR','CUBIC')
xlim([0,8])
xlabel('time (sec)')
ylabel('RTT (msec)')
title(' Latency Comparison between CUBIC & BBR')
