# 42Push_Swap-Tester
Tester for the 42 cursus project: Push Swap.

It has a heavy focus on error handling.

The tester searches for the executable in the parent directory.
Just clone the repo **inside** your Pipex directory, move (cd) into the tester repo and run the tester with ```bash test_ps.sh```.
1. Clone with: ```git@github.com:albertcaballero/42Push_Swap-Tester.git```
2. ```cd 42Push_Swap-Tester``` (or whatever name you called it)
3. ```bash test_ps.sh```

## How does it work
The tester evaluates various aspects of the project:
1. Error handling: checks that your program returns ```Error``` when needed (and doesn't when not needed, obviously).
2. 3 numbers: checks that with an input of 3 numbers, the order is correct and the number of movements is below the max.
3. 5 numbers: checks that with an input of 5 numbers, the order is correct and the number of movements is below the max.
4. 100 numbers: checks with an input of 100 numbers, also calculates the average movements.
5. 500 numbers: checks with an input of 500 numbers, also calculates the average movements.

For 100 and 500 numbers, the command to generate them is this: ``` `seq -100 399 | sort -R | tr "\n" " "` ``` (generates the sequence of numbers between -100 and 300 (so 500 nums), and sorts them randomly).

## Troubleshooting (common mistakes)
1. **Almost all Error handling gives me KO, but I am sure it is OK** \
You are most probably not sending them through Stderr (fd 2).

2. **It sometimes gets hung on an infinite loop** \
Idk, check your program.
