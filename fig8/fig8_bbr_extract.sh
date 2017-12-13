for b in {1..8}
do
cat loss_bbr_"$b".txt | awk '{print $7}' | awk 'END{print}' 
done
