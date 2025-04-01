
count_odd_negative([], 0).

count_odd_negative([Head|Tail], Count) :-
    Head < 0,
    Head mod 2 =\= 0,
    count_odd_negative(Tail, RestCount),
    Count is RestCount + 1.

count_odd_negative([_|Tail], Count) :-
    count_odd_negative(Tail, Count).


count_odd_negative_elements(List, Count) :-
    count_odd_negative(List, Count).


read_list(List) :-
    write('Введите числа через пробел для создания списка: '), nl,
    read_list_helper([], List).

read_list_helper(Acc, List) :-
    read_line_to_string(user_input, Line),
    (   Line = ""
    ->  maplist(string_to_integer, Acc, List)
    ;   split_string(Line, " ", "", StringList),
        append(Acc, StringList, NewAcc),
        read_list_helper(NewAcc, List)
    ).

string_to_integer(String, Integer) :-
    string_to_atom(String, Atom),
    atom_number(Atom, Integer).

main :-
    read_list(List),
    count_odd_negative_elements(List, Count),
    write('Список: '), write(List), nl,
    write('Кол-во отрицательных нечетных элемента: '), write(Count), nl.
