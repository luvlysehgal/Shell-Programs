#!/bin/bash -x
threeDigitNum=$((RANDOM%900+100))
echo $threeDigitNum
declare -A number=([even]=0 [odd]=0)
declare -A primenum=([count]=0)
for (( i=2;$threeDigitNum>1;i++ ))
do
   while [ $(($threeDigitNum%$i)) -eq 0 ]
   do
      threeDigitNum=$(($threeDigitNum/$i))
      primefac[i]=$(($i))
      echo "Prime number is: " ${primefac[i]}
      if [ $((${primefac[i]}%2)) -eq 0 ]
      then
          arr1[i]=$(($i))
          ((number[even]++))
      else
          arr2[i]=$(($i))
          ((number[odd]++))
      fi
   done
done
echo "....The Prime factor of number is..."
echo "${primefac[@]}"
echo "Even:  " ${arr1[@]}
echo "Odd: " ${arr2[@]}
echo "KEYS: ${!number[@]}"
echo "COUNT: ${number[@]}"

revnum=0
function palindrome() {

   num=$1
   while [ $num -gt 0 ]
   do
      singledig=$(($num%10))
      revnum=$(($revnum*10+$singledig))
      num=$(($num/10))
   done
   echo $revnum
}
threeDigitNum2=$((RANDOM%900+100))
orignum=$threeDigitNum2
revnum="$( palindrome $threeDigitNum2 )"
if [ $revnum -eq $orignum ]
then
   echo "This is  Palindrome number"
else
   echo "This is not a Palindrome number"
fi
