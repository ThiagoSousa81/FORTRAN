PROGRAM GerenciadorDeTarefas

    ! Declaração das variáveis
    CHARACTER(100) :: descricao, categoria
    INTEGER :: prioridade
    TYPE task
        CHARACTER(100) :: descricao
        INTEGER :: prioridade
        CHARACTER(50) :: categoria
        TYPE(task), POINTER :: next
    END TYPE task
    TYPE(task), POINTER :: lista_tarefas

    ! Função para criar uma nova tarefa
    FUNCTION create_task(descricao, prioridade, categoria) RESULT(nova_tarefa)
        CHARACTER(100), INTENT(IN) :: descricao
        INTEGER, INTENT(IN) :: prioridade
        CHARACTER(50), INTENT(IN) :: categoria
        TYPE(task), POINTER :: nova_tarefa
        ALLOCATE(nova_tarefa)
        nova_tarefa%descricao = descricao
        nova_tarefa%prioridade = prioridade
        nova_tarefa%categoria = categoria
        nova_tarefa%next => NULL()
    END FUNCTION create_task

    ! Subrotina para adicionar uma nova tarefa à lista
    SUBROUTINE add_task(lista_tarefas, descricao, prioridade, categoria)
        TYPE(task), POINTER :: lista_tarefas
        CHARACTER(100), INTENT(IN) :: descricao
        INTEGER, INTENT(IN) :: prioridade
        CHARACTER(50), INTENT(IN) :: categoria
        TYPE(task), POINTER :: nova_tarefa, curr_tarefa, prev_tarefa
        nova_tarefa => create_task(descricao, prioridade, categoria)

        IF (.NOT. ASSOCIATED(lista_tarefas)) THEN
            lista_tarefas => nova_tarefa
        ELSE
            curr_tarefa => lista_tarefas
            prev_tarefa => NULL()

            DO WHILE (ASSOCIATED(curr_tarefa) .AND. curr_tarefa%prioridade >= nova_tarefa%prioridade)
                prev_tarefa => curr_tarefa
                curr_tarefa => curr_tarefa%next
            END DO

            IF (.NOT. ASSOCIATED(prev_tarefa)) THEN
                nova_tarefa%next => lista_tarefas
                lista_tarefas => nova_tarefa
            ELSE
                prev_tarefa%next => nova_tarefa
                nova_tarefa%next => curr_tarefa
            END IF
        END IF
    END SUBROUTINE add_task

    ! Subrotina para imprimir a lista de tarefas
    SUBROUTINE print_tasks(lista_tarefas)
        TYPE(task), POINTER :: lista_tarefas
        TYPE(task), POINTER :: curr_tarefa

        curr_tarefa => lista_tarefas
        DO WHILE (ASSOCIATED(curr_tarefa))
            WRITE(*, '(A)', ADVANCE='NO') "Descrição: ", curr_tarefa%descricao, NEWLINE('')
            WRITE(*, '(A,I0)', ADVANCE='NO') "Prioridade: ", curr_tarefa%prioridade, NEWLINE('')
            WRITE(*, '(A)', ADVANCE='NO') "Categoria: ", curr_tarefa%categoria, NEWLINE('')
            WRITE(*, NEWLINE(''))
            curr_tarefa => curr_tarefa%next
        END DO
    END SUBROUTINE print_tasks

    ! Programa principal
    CALL add_task(lista_tarefas, "Estudar para a prova de matemática", 2, "Estudos")
    CALL add_task(lista_tarefas, "Lavar a louça", 1, "Casa")
    CALL add_task(lista_tarefas, "Fazer exercícios físicos", 3, "Saúde")

    CALL print_tasks(lista_tarefas)

END PROGRAM GerenciadorDeTarefas
