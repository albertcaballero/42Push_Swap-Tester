RED="\033[38;5;161m"
GREEN="\033[38;5;154m"
YELLOW="\033[38;5;227m"
BLUE="\033[38;5;81m"
PURPLE="\033[38;5;93m"
PINK="\033[38;5;219m"
NC="\033[0m"

chmod 777 checker_Mac
make -C ..
testnbr=1
printf "\n🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲\n"
printf "$GREEN\n\t🌟=======ALCABALL PUSHSWAP TESTER========🌟\n$NC"
printf "$PINK\nIf there's any issue or something to improve, pls tell me!! :)\n\
	Feedback is greatly welcome! (Campus/Slack)\n"
printf "\n🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲\n"

res=0
err=0
printf "$PURPLE\n_______ERROR HANDLING_______\n$NC" #=======================================================
printf "\n$BLUE====TEST $testnbr ====$YELLOW(empty string)(Expected: Error)\n$NC"
../push_swap "3" "1" "" > /dev/null 2> err_check.txt
err=$(cat err_check.txt | wc -l)
if [ $err -eq 1 ]
	then
		printf "$GREEN OK"
	else
		printf "$RED KO"
fi
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ====$YELLOW(no input)(Expected: NOTHING)\n$NC"
../push_swap > /dev/null 2> err_check.txt
err=$(cat err_check.txt | wc -l)
if [ $err -eq 0 ]
	then
		printf "$GREEN OK"
	else
		printf "$RED KO"
fi
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ====$YELLOW(spaces)(Expected: Error)\n$NC"
../push_swap "4" "6" "     " > /dev/null 2> err_check.txt
err=$(cat err_check.txt | wc -l)
if [ $err -eq 1 ]
	then
		printf "$GREEN OK"
	else
		printf "$RED KO"
fi
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ====$YELLOW(letters btwn numbers)(Expected: Error)\n$NC"
../push_swap "3a3" "2345" "324j455" "78" > /dev/null 2> err_check.txt
err=$(cat err_check.txt | wc -l)
if [ $err -eq 1 ]
	then
		printf "$GREEN OK"
	else
		printf "$RED KO"
fi
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ====$YELLOW(only 1 number)(Expected: NOTHING)\n$NC"
../push_swap "92" > err_check.txt
err=$(cat err_check.txt | wc -l)
if [ $err -eq 0 ]
	then
		printf "$GREEN OK"
	else
		printf "$RED KO"
fi
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ====$YELLOW(repeated numbers)(Expected: Error)\n$NC"
../push_swap "92" "42" "67" "87" "92" "727" > /dev/null 2> err_check.txt
err=$(cat err_check.txt | wc -l)
if [ $err -eq 1 ]
	then
		printf "$GREEN OK"
	else
		printf "$RED KO"
fi
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ====$YELLOW(repeated with leading zeroes)(Expected: Error)\n$NC"
../push_swap "92" "42" "67" "87" "00092" "727" > /dev/null 2> err_check.txt
err=$(cat err_check.txt | wc -l)
if [ $err -eq 1 ]
	then
		printf "$GREEN OK"
	else
		printf "$RED KO"
fi
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ====$YELLOW(repeated with signs)(Expected: Error)\n$NC"
../push_swap "92" "42" "67" "87" "+92" "727" > /dev/null 2> err_check.txt
err=$(cat err_check.txt | wc -l)
if [ $err -eq 1 ]
	then
		printf "$GREEN OK"
	else
		printf "$RED KO"
fi
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ====$YELLOW(use of signs)(Expected: Normal)\n$NC"
../push_swap "92" "42" "+67" "87" "-727" > /dev/null 2> err_check.txt
err=$(cat err_check.txt | wc -l)
if [ $err -eq 0 ]
	then
		printf "$GREEN OK"
	else
		printf "$RED KO"
fi
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ====$YELLOW(double signs)(Expected: Error)\n$NC"
../push_swap "92" "42" "+67" "--727" > /dev/null 2> err_check.txt
err=$(cat err_check.txt | wc -l)
if [ $err -eq 1 ]
	then
		printf "$GREEN OK"
	else
		printf "$RED KO"
fi
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ====$YELLOW(bigger than max int)(Expected: Error)\n$NC"
../push_swap "21474836499" "54546" "3877" > /dev/null 2> err_check.txt
err=$(cat err_check.txt | wc -l)
if [ $err -eq 1 ]
	then
		printf "$GREEN OK"
	else
		printf "$RED KO"
fi
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ====$YELLOW(bigger than max long)(Expected: Error)\n$NC"
../push_swap "429496729433" "54546" "3877" > /dev/null 2> err_check.txt
err=$(cat err_check.txt | wc -l)
if [ $err -eq 1 ]
	then
		printf "$GREEN OK"
	else
		printf "$RED KO"
fi
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ====$YELLOW(smaller than min int)(Expected: Error)\n$NC"
../push_swap "-21474836499" "456" "6476" > /dev/null 2> err_check.txt
err=$(cat err_check.txt | wc -l)
if [ $err -eq 1 ]
	then
		printf "$GREEN OK"
	else
		printf "$RED KO"
fi
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ====$YELLOW(already ordered 4)(Expected: NOTHING)\n$NC"
../push_swap "1" "4" "66" "88" > err_check.txt
err=$(cat err_check.txt | wc -l)
if [ $err -eq 0 ]
	then
		printf "$GREEN OK"
	else
		printf "$RED KO"
fi
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ====$YELLOW(already ordered 2)(Expected: NOTHING)\n$NC"
../push_swap "1" "4" > err_check.txt
err=$(cat err_check.txt | wc -l)
if [ $err -eq 0 ]
	then
		printf "$GREEN OK"
	else
		printf "$RED KO"
fi
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ====$YELLOW(already ordered 7)(Expected: NOTHING)\n$NC"
../push_swap "1" "4" "7" "8" "10" "100" "10000" > err_check.txt
err=$(cat err_check.txt | wc -l)
if [ $err -eq 0 ]
	then
		printf "$GREEN OK"
	else
		printf "$RED KO"
fi

printf "$PURPLE\n_______3 NUMBERS_______$YELLOW(Expected MAX: 3, OK)\n" #======================
testnbr=1
x=1
movs=0
res="OK"
ok=0
perf=0
while [ $x -le 20 ]
do
	ARG=`seq 1 3 | sort -R | tr "\n" " "`;
	printf "$BLUE||$testnbr-$NC"
	movs=$(../push_swap ${ARG} | wc -l | awk '{print $1}')
	res=$(../push_swap ${ARG} | ./checker_Mac ${ARG})
if [ $movs -le 12 ]
	then
		printf "$GREEN $movs $NC"
		perf=$(( $perf + 1 ))
else
	printf "$RED $movs $NC"
fi
if [ $res = "OK" ]
	then
		printf "$GREEN OK"
		ok=$(( $ok + 1 ))
	else
		printf "$RED KO"
fi
	testnbr=$(($testnbr + 1))
	x=$(( $x + 1 ))
done
x=$(( $x - 1 ))
printf "$PINK\n\nGood tests (order): $ok/$x\nPerfect tests (movements 5/5): $perf/$x\n"

printf "$PURPLE\n_______5 NUMBERS_______$YELLOW(Expected MAX: 12, OK)\n" #============
testnbr=1

x=1
movs=0
res="OK"
ok=0
perf=0
while [ $x -le 40 ]
do
	ARG=`seq -4 0 | sort -R | tr "\n" " "`;
	printf "$BLUE||$testnbr-$NC"
	movs=$(../push_swap ${ARG} | wc -l | awk '{print $1}')
	res=$(../push_swap ${ARG} | ./checker_Mac ${ARG})
if [ $movs -le 12 ]
	then
		printf "$GREEN $movs $NC"
		perf=$(( $perf + 1 ))
else
	printf "$RED $movs $NC"
fi
if [ $res = "OK" ]
	then
		printf "$GREEN OK"
		ok=$(( $ok + 1 ))
	else
		printf "$RED KO"
fi
	testnbr=$(($testnbr + 1))
	x=$(( $x + 1 ))
done
x=$(( $x - 1 ))
printf "$PINK\n\nGood tests (order): $ok/$x\nPerfect tests (movements 5/5): $perf/$x\n"

printf "$PURPLE\n_______100 NUMBERS_______$YELLOW(Max: 1500, Perfect: 700)\n" #=======================
testnbr=1

x=1
movs=0
res="OK"
perf=0
ok=0
avg=0
while [ $x -le 50 ]
do
	ARG=`seq -50 49 | sort -R | tr "\n" " "`;
	printf "$BLUE==== TEST $testnbr =$NC"
	movs=$(../push_swap ${ARG} | wc -l)
	res=$(../push_swap ${ARG} | ./checker_Mac ${ARG})
	if [ $movs -le 700 ]
		then
			printf "$GREEN $movs $NC"
			perf=$(( $perf + 1 ))
	elif [ $movs -le 1500 ]
		then
			printf "$YELLOW $movs $NC"
	elif [ $movs -gt 1500 ]
		then
			printf "$RED $movs $NC"
	fi
	if [ $res = "OK" ]
		then
			printf "$GREEN OK\n"
			ok=$(( $ok + 1 ))
		else
			printf "$RED KO\n"
	fi
	testnbr=$(($testnbr + 1))
	x=$(( $x + 1 ))
	avg=$(( $avg + $movs ))
done

x=$(( $x - 1 ))
avg=$(( $avg / $x ))
printf "$PINK\nGood tests (order): $ok/$x\nPerfect tests (movements 5/5): $perf/$x\nAverage movements: $avg\n"

printf "$PURPLE\n_______500 NUMBERS_______$YELLOW(Max: 11500, Perfect: 5500)\n" #=======================================================
testnbr=1

x=1
movs=0
res="OK"
perf=0
ok=0
avg=0
while [ $x -le 50 ]
do
  	ARG=`seq -100 399 | sort -R | tr "\n" " "`;
	printf "$BLUE==== TEST $testnbr =$NC"
	movs=$(../push_swap ${ARG} | wc -l)
	res=$(../push_swap ${ARG} | ./checker_Mac ${ARG})
	if [ $movs -le 5500 ]
		then
			printf "$GREEN $movs $NC"
			perf=$(( $perf + 1 ))
	elif [ $movs -le 11500 ]
		then
			printf "$YELLOW $movs $NC"
	elif [ $movs -gt 11500 ]
		then
			printf "$RED $movs $NC"
	fi
	if [ $res = "OK" ]
		then
			printf "$GREEN OK\n"
			ok=$(( $ok + 1 ))
		else
			printf "$RED KO\n"
	fi
	testnbr=$(($testnbr + 1))
	x=$(( $x + 1 ))
	avg=$(( $avg + $movs ))
done

x=$(( $x - 1 ))
avg=$(( $avg / $x ))
printf "$PINK\nGood tests (order): $ok/$x\nPerfect tests(movement 5/5): $perf/$x\nAverage movements: $avg\n"
rm err_check.txt

printf "$NC\n🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲\n"
printf "\n\t$GREEN 🌟========TESTS COMPLETED, GOOD LUCK!========🌟\n$NC"
printf "$PINK By Albert Caballero\n Intra: Alcaball\n Github: https://github.com/albertcaballero\n$NC"
printf "$NC\n🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲\n"