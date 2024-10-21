# Sistema de Gerenciamento de Compromissos

## Descrição
Este projeto é um sistema de gerenciamento de compromissos que organiza e prioriza eventos com base em critérios de importância e urgência. Ele utiliza a integração entre **Python** e **Prolog** para realizar a captura de dados e a lógica de organização. O usuário insere os compromissos no sistema Python, e o Prolog lida com a organização e alocação de horários.

## Funcionalidades
- **Adicionar Compromissos**: O sistema permite a adição de compromissos, solicitando informações como nome, importância e urgência.
- **Organizar Compromissos**: Os compromissos são ordenados automaticamente com base na prioridade (importância e urgência) e alocados para as datas disponíveis mais próximas.
- **Listar Compromissos**: O sistema exibe a lista de compromissos já organizados e agendados, mostrando-os com suas respectivas datas e horários.

## Tecnologias Utilizadas
- **Python**: A interface com o usuário e a lógica de manipulação dos dados foram desenvolvidas em Python.
- **Prolog**: Responsável pela lógica de priorização e agendamento dos compromissos.
- **PySWIP**: Uma biblioteca que conecta o Python ao Prolog.

## Requisitos
- **Python 3.x**: Certifique-se de ter o Python instalado.
- **Biblioteca PySWIP**: Instalar via pip:
  ```bash
  pip install pyswip
