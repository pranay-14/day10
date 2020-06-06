#! /bin/bash 
head=1;
tail=0;
head_cnt=0
tail_cnt=0
for (( i=1; i<=21; i++ ))
do
	flipcoincheck=$((RANDOM%2))
	if [ $flipcoincheck -eq $head ]
	then
        	head_cnt=$(( $head_cnt + 1 ))
	elif [ $flipcoincheck -eq $tail ]
	then
        	tail_cnt=$(( $tail_cnt + 1 ))
	fi
done
echo "head_count=$head_cnt"
echo "tail_count=$tail_cnt"
if [ $head_cnt -eq $tail_cnt ]
then 
	echo "Tie"
	while [[ $(($head_cnt-$tail_cnt)) -lt 2 && $(($tail_cnt-$head_cnt)) -lt 2 ]]
	do
		flipcoincheck=$((RANDOM%2))
		if [ $flipcoincheck -eq $head ];
	        then
         	       head_cnt=$(( $head_cnt + 1 ))
        	elif [ $flipcoincheck -eq $tail ]
        	then
                	tail_cnt=$(( $tail_cnt + 1 ))
        	fi
	done
	if [ $head_cnt -gt $tail_cnt ]
	then
        	echo "Head wins"
        	won_by=$(($head_cnt-$tail_cnt))
        	echo "head won by:$won_by"
	else
		echo "Tail wins"
		won_by=$(($tail_cnt-$head_cnt))
        	echo "tail won by:$won_by"
	fi
		
elif [ $head_cnt -lt $tail_cnt ]
then
	echo "Tail wins"
	won_by=$(($tail_cnt-$head_cnt))
	echo "tail won by:$won_by"
elif [ $head_cnt -gt $tail_cnt ]
then
        echo "Head wins"
	won_by=$(($head_cnt-$tail_cnt))
        echo "head won by:$won_by"
fi
