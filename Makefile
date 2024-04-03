##
## EPITECH PROJECT, 2023
## makefile
## File description:
## Makefile myprintf
##

NAME	=	my_exec

SRC	=	main.c

OBJ	=	$(SRC:.c=.o)

CFLAGS	=	-W -Wall -Wextra

CPPFLAGS	=	-Iinclude/

DBUGFLAGS = -g3

DBUGRUN_LOGNAME = valgrind-out.txt

DBUGRUN_FLAGS = --leak-check=yes --show-leak-kinds=all --track-origins=yes \
				--verbose --log-file=$(DBUGRUN_LOGNAME) \
				--trace-children=yes --track-fds=yes

all:	$(NAME)

$(NAME):	$(OBJ)
	$(CC) -o $(NAME) $(OBJ)

clean:
		$(RM) $(NAME)

fclean:	clean
		$(RM) $(OBJ)

re: fclean all

debug: CFLAGS += $(DBUGFLAGS)
debug: $(OBJ)
	$(MAKE) -C lib/my
	$(CC) -o $(NAME) $(OBJ) $(LDFLAGS) $(DBUGFLAGS)

debug_re: fclean debug

debug_run: debug_re
	valgrind $(DBUGRUN_FLAGS) ./$(NAME) $(TEST_VALUES)
	cat $(DBUGRUN_LOGNAME)
	echo $$(cat $(DBUGRUN_LOGNAME))
