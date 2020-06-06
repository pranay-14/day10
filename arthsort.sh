#!/usr/local/bin/bash 

echo "Arithmatic Computation and Sorting"

echo "Enter Three Number"
read firstNumber;
read secondNumber;
read thirdNumber;

operationFirst=$(($firstNumber+$secondNumber*$thirdNumber));
operationSecond=$(($firstNumber*$secondNumber+$thirdNumber));
operationThird=$(($thirdNumber+$firstNumber/$secondNumber));
operationFourth=$(($firstNumber%$secondNumber+$thirdNumber));

declare -A result
result[0]="$operationFirst";
result[1]="$operationSecond";
result[2]="$operationThird";
result[3]="$operationFourth";

resultArray[0]="${result[0]}"
resultArray[1]="${result[1]}"
resultArray[2]="${result[2]}"
resultArray[3]="${result[3]}"

arrayLength=${#resultArray[@]}
for (( i=0;i<$arrayLength;i++ ))
do
   for (( j=i+1;j<$arrayLength;j++ ))
   do
      if [ ${resultArray[i]} -lt ${resultArray[j]} ];
      then
         temp=${resultArray[i]};
         resultArray[$i]=${resultArray[j]};
         resultArray[$j]=$temp;
      fi
   done
done

for (( i=0;i<$arrayLength;i++ ))
do
   for (( j=i+1;j<$arrayLength;j++ ))
   do
      if [ ${resultArray[i]} -gt ${resultArray[j]} ];
      then
         temp=${resultArray[i]};
         resultArray[$i]=${resultArray[j]};
         resultArray[$j]=$temp;
      fi
   done
done

echo ${resultArray[@]};
