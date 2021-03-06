% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный


qsort(L,K):-
		L = [Head|Tail],
		partition(Head, Tail, List1, List2),
		qsort(List1, Sorted1),
		qsort(List2, Sorted2),
		append(Sorted1, [Head|Sorted2], K).

qsort([], []).

partition(Current, [Head|Tail], [Head|LowEq], High):-
		Current >= Head,
		partition(Current, Tail, LowEq, High).

partition(Current, [Head|Tail], LowEq, [Head|High]):-
		partition(Current, Tail, LowEq, High).

partition(_, [], [], []).


sort:-
	List = [ 7, - 10, 15, 35, - 45, - 45, 19, 72, 1, - 1 ],
	qsort(List, Sorted),
	write(Sorted).


% [- 45,- 45,- 10,- 1,1,7,15,19,35,72]
% List = [7, - 10, 15, 35, - 45, - 45, 19, 72, 1|...],
% Sorted = [- 45, - 45, - 10, - 1, 1, 7, 15, 19, 35|...]

