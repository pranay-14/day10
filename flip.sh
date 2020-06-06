#!/usr/local/bin/bash 
#usecase 1 flip coin display head and tail

function flipCoin(){
	randomCheck=$((RANDOM%2))
	if [ $randomCheck -eq 0 ]
	then
		echo "HEAD"
	else
		echo "TAIL"
	fi
}

#usecase 2 multipal time storing the coin store in a dictionary

declare -A singlets
declare -A  winingCombination
isHead="HEAD"
read -p "Enter number of times to flip the coin " n;
for (( i=0;i<n;i++ ))
do
	result="$( flipCoin )"
	singlets[$i]=$result;
	if [ "$result" == "$isHead" ]
	then
		heads=$((heads+1));
	else
		tails=$((tails+1));
	fi
done
echo "Generated Singlets:"
echo ${singlets[@]};
echo "Percentage of Singlets";
echo "Percentage of Heads:= $((heads*100/n))";
echo "Percentage of Tails:= $((tails*100/n))";
winingCombination[H]=$((heads*100/n))
winingCombination[T]=$((tails*100/n))
#usecase 3 create doubleat combination

declare -A doublets
hh=0
ht=0
th=0
tt=0
for (( i=0;i<n;i++ ))
do
	result="$( flipCoin )""$( flipCoin )"
	doublets[$i]=$result;
	if [ "$result" == "HEADHEAD" ]
   then
		hh=$((hh+1));
	elif [ "$result" == "HEADTAIL" ]
	then
		ht=$((ht+1));
	elif [ "$result" == "TAILHEAD" ]
	then
		th=$((th+1));
	else
		tt=$((tt+1));
	fi
done
echo "Generated doublets:"
echo ${doublets[@]};
echo "Percentage of HH = $((hh*100/n))";
echo "Percentage of TT = $((tt*100/n))";
echo "Percentage of HT = $((ht*100/n))";
echo "Percentage of TH = $((th*100/n))";
winingCombination[HH]=$((hh*100/n));
winingCombination[TT]=$((tt*100/n));
winingCombination[HT]=$((ht*100/n));
winingCombination[TH]=$((th*100/n));

#Usecase 4 store Triplets in a dictionary

declare -A triplets
hhh=0
hht=0
hth=0
htt=0
thh=0
tht=0
tth=0
ttt=0
for (( i=0;i<n;i++ ))
do
	result="$( flipCoin )""$( flipCoin )""$( flipCoin )";
	triplets[$i]=$result;
	case $result in
		"HEADHEADHEAD")
			hhh=$((hhh+1));
			;;
		"HEADHEADTAIL")
			hht=$((hht+1));
			;;
		"HEADTAILHEAD")
			hth=$((hth+1));
			;;
		"HEADTAILTAIL")
			htt=$((htt+1));
			;;
		"TAILHEADHEAD")
			thh=$((thh+1));
			;;
		"TAILHEADTAIL")
			tht=$((tht+1));
			;;
		"TAILTAILHEAD")
			tth=$((tth+1));
			;;
		"TAILTAILTAIL")
			ttt=$((ttt+1));
			;;
	esac
done
echo "Generated triplets:"
echo ${triplets[@]};
echo "Percentage of HHH= $((hhh*100/n))";
echo "Percentage of TTH= $((tth*100/n))";
echo "Percentage of HTH= $((hth*100/n))";
echo "Percentage of THH= $((thh*100/n))";
echo "Percentage of HHT= $((hht*100/n))";
echo "Percentage of TTT= $((ttt*100/n))";
echo "Percentage of HTT= $((htt*100/n))";
echo "Percentage of THT= $((tht*100/n))";
winingCombination[HHH]=$((hhh*100/n))
winingCombination[TTH]=$((tth*100/n))
winingCombination[HTH]=$((hth*100/n))
winingCombination[THH]=$((thh*100/n))
winingCombination[HHT]=$((hht*100/n))
winingCombination[TTT]=$((ttt*100/n))
winingCombination[HTT]=$((htt*100/n))
winingCombination[THT]=$((tht*100/n))

# use case last winning percenage

echo ${winingCombination[@]}
for k in "${!winingCombination[@]}"
do
    echo $k ' - ' ${winingCombination["$k"]}
done | sort -rn -k3
