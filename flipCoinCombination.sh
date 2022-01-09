echo "------------------------------- Well come flip coin simulator ---------------------------"
declare -A flipStore

isFlip=0
maximum=0
temp=0
function totalFlip()
{
	for((index=0; index<$1; index++))
	do
		side=""
		for((indexOne=0; indexOne<$2; indexOne++))
		do
			flipCoin=$((RANDOM%2))
			if [ $flipCoin -eq $isFlip ]
			then
				side+=H
			else
				side+=T
			fi
		done
		flipStore[$side]=$((${flipStore[$side]}+1))
	done
	echo "Count of all combination     :${flipStore[@]}"
}
function totalPercentageFlip()
{
	for count in ${!flipStore[@]}
	{
		flipStore[$count]=`echo "scale=2; $((${flipStore[$count]}))/$times*100 " | bc`
		temp=${flipStore[$count]}
		if (( $(echo "$temp >= $maximum"| bc) ))
		then
			maximum=$temp
			key=$count
		fi
	}
}
read -p "Enter number of times you want to flip:" times
read -p "Enter choice 1)Singlet 2)Doublet 3)Triplet and so on:" coins
totalFlip $times $coins
totalPercentageFlip
echo "All head and tail combination:${!flipStore[@]}"
echo "percentage of all combination:${flipStore[@]}"
echo "Max winning combination      :" $maximum "-" $key