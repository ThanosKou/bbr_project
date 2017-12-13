clear; close all; 
    
num_flows = 5 ;
bw = 100 ;

x = load('flows_throughput.txt') ; 

figure ; 

for i=1:num_flows
    z = x(i:5:end) ;
    plot(1:length(z), z) 
    hold on; 
end 
xlim([0 length(z)+10])
ylim([0 100])
plot([1 length(z)],[bw/num_flows bw/num_flows])
text(53,20,'fair share')
xlabel('time (sec)')
ylabel('Throughput (Mbps)')
title(' Throughputs of 5 flows sharing a bottleneck')
print -dpdf fair
