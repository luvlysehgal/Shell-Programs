#!/bin/bash -x
threeDigitNum=$((RANDOM%900+100))
for (( i=2;$threeDigitNum>1;i++ ))
do
   while [ $(($threeDigitNum%$i)) -eq 0 ]
   do
      array2[$i]=$i
      echo ${array2[$i]}
      threeDigitNum=$(($threeDigitNum/$i))
      if [[ ${array[$i]} % 2 -eq 0 ]]
      then
          echo ${array[$i]} " is even number"
          number[even]=$i
      else
          echo ${array[$i]} " is odd number"
          number[odd]=$i
      fi
   done
done
echo "....The Prime factor of number is..." 
echo ${array2[@]}
echo ${number[@]} "These are the even numbers"
echo ${number[@]} "These are the odd numbers"
revnum=0
palindrome() {

   num=$1
   while [ $threeDigitNum -gt 0 ]
   do
      singledig=$(($threeDigNum%10))
      revnum=$(($revnum*10+$singledig))
      num=$(($threeDigitNum/10))
   done
   return $revnum
}

orignum=$threeDigNum
palindrome $threeDigitNum
revnum=$?
if [ $revnum -eq $orignum ]
then
   echo "This is  Palindrome number"
else
   echo "This is not a Palindrome number"
fi
