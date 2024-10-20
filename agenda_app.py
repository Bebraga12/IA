from pyswip import Prolog

# Inicializar Prolog
prolog = Prolog()

# Carregar a base de conhecimento Prolog
prolog.consult("agenda.pl")

# Funcao para adicionar tres compromissos
def adicionar_tres_compromissos():
    for i in range(3):
        nome = input(f"Digite o nome do compromisso {i+1}: ")
        importancia = input(f"Digite a importancia do compromisso {i+1} (alta, media, baixa): ").lower()
        urgencia = input(f"Digite a urgencia do compromisso {i+1} (alta, media, baixa): ").lower()

        # Adiciona o compromisso na base de conhecimento Prolog
        prolog.assertz(f"compromisso('{nome}', _, '{importancia}', '{urgencia}')")
        print(f"Compromisso '{nome}' adicionado com sucesso!")

# Funcao para ordenar e listar compromissos
def listar_compromissos():
    # Ordena os compromissos e aloca os horarios
    list(prolog.query("ordenar_e_alocar"))
    
    # Exibe os compromissos com horarios alocados
    resultados = list(prolog.query("listar_compromissos"))
    for resultado in resultados:
        print(resultado)

# Executa o programa
adicionar_tres_compromissos()
listar_compromissos()
