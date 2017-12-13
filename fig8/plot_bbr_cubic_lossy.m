clear; close all;

%% Load files and make sure that they have length of 10 


x = load('fig8_bbr_goodput.txt') ;
if length(x) < 10 
    for i =1:10-length(x)
        x = [x ; 0] ;
    end 
end 
y = load('fig8_cubic_goodput.txt') ;

if length(y) < 10 
    for i =1:10-length(y)
        y = [y ; 0] ;
    end 
end 


loss = [0.001; 0.01; 0.1; 1; 2; 5; 10; 20; 30; 50] ; 

%% PLot the results 

figure; 
semilogx(loss, x)
hold on;
semilogx(loss,y)
legend('BBR','CUBIC')
title('Goodput of BBR vs CUBIC in lossy scenarios')
xlim([0 55])
ylim([0 100])
xlabel('loss (%)')
ylabel('Throughput(Mbps)')
print -dpdf 'lossy'

