declare -A Operation

read -p "Enter First Number :" a
read -p "Enter Second input:" b
read -p "Enter Third input :" c


result1=`echo $(($a + $b * $c))`
echo "Result:" $result1

result2=`echo $(($a * $b + $c))`
echo "Result:" $result2

result3=`echo $(($c + $a / $b))`
echo "Result:" $result3

result4=`echo $(($a % $b + $c))`
echo "Result:" $result4


Operation[result1]=$result1
Operation[result2]=$result2
Operation[result3]=$result3
Operation[result4]=$result4

n=${#Operation[@]}
for((i=0; i<n; i++))
do
  array[i]=${Operation[result$((i+1))]}
done

echo "${array[@]}"
for ((i = 0; i<n; i++))
do
	for((j = 0; j<n-i-1; j++))
	do
		if [ ${array[j]} -gt ${array[$((j+1))]} ]
        	then
        		temp=${array[j]}
            		array[$j]=${array[$((j+1))]}  
            		array[$((j+1))]=$temp
        	fi
    	done
done
echo "Array in sorted order :"
echo ${array[*]}
for ((i = 0; i<n; i++))
do
	for((j = 0; j<n-i-1; j++))
	do
		if [ ${array[j]} -lt ${array[$((j+1))]} ]
        	then
        	    	temp=${array[j]}
            		array[$j]=${array[$((j+1))]}  
            		array[$((j+1))]=$temp
        	fi
    	done
done
echo "Array in Descending order :"
echo ${array[*]}