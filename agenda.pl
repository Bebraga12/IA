% Define o fato compromisso com Nome, Horario, Importancia e Urgencia
:- dynamic compromisso/4.

% Regras para definir a prioridade com base em importancia e urgencia
calcularprioridade(Importancia, Urgencia, Prioridade) :-
    (Importancia == alta, Urgencia == alta -> Prioridade is 1;
     Importancia == alta, Urgencia == media -> Prioridade is 2;
     Importancia == alta, Urgencia == baixa -> Prioridade is 3;
     Importancia == media, Urgencia == alta -> Prioridade is 4;
     Importancia == media, Urgencia == media -> Prioridade is 5;
     Importancia == media, Urgencia == baixa -> Prioridade is 6;
     Importancia == baixa, Urgencia == alta -> Prioridade is 7;
     Importancia == baixa, Urgencia == media -> Prioridade is 8;
     Importancia == baixa, Urgencia == baixa -> Prioridade is 9).

% Lista de horarios (substituindo datas)
horarios([1, 2, 3, 4, 5]).

% Ordena compromissos pela prioridade e aloca os horarios
ordenar_e_alocar :- 
    findall([P, Nome, Importancia, Urgencia], 
        (compromisso(Nome, _, Importancia, Urgencia), 
         calcularprioridade(Importancia, Urgencia, P)), 
        Compromissos), 
    sort(Compromissos, Ordenados),
    horarios(Horarios),
    alocar_horarios(Ordenados, Horarios).

% Funcao para alocar os horarios predefinidos aos compromissos
alocar_horarios([], _).
alocar_horarios([[_, Nome, Importancia, Urgencia]|T], [Horario|HorariosRestantes]) :-
    retract(compromisso(Nome, _, Importancia, Urgencia)), 
    assertz(compromisso(Nome, Horario, Importancia, Urgencia)),
    alocar_horarios(T, HorariosRestantes).

% Funcao para listar os compromissos com os horarios alocados
listar_compromissos :- 
    forall(compromisso(Nome, Horario, Importancia, Urgencia),
        format('Compromisso: ~w, Horario: ~w, Importancia: ~w, Urgencia: ~w~n', 
        [Nome, Horario, Importancia, Urgencia])).
