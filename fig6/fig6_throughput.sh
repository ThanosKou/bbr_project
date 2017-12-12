#!/bin/bash
for b  in {1..5}
do
cat throughput-report-"$b".txt | awk '{print ($0+0)}' | awk '($1!=0) {print}' > flow_throughput_"$b".txt
done
