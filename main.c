/*
** EPITECH PROJECT, 2023
** sokoban
** File description:
** File to contain main file, the game loop, and the funcs calls
*/

#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

int main(int ac, char **av)
{
    if (ac != 2)
        return 84;
    if (av[1][0] == '-' && av[1][1] == 'h') {
        printf("USAGE\n\tTHIS IS A SOKOBAN GAME\n");
        return 0;
    }
    return (0);
}
