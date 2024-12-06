-- criando meu primeiro banco de dados
CREATE DATABASE senac_copacabana; -- comando para criar o banco de dados e o nome do banco

-- criando minha primeira tabela/entidade
CREATE TABLE alunos (  
  matricula INTEGER PRIMARY KEY,
  nome_aluno TEXT NOT NULL,
  genero TEXT NOT NULL
);
-- injeção de dados-teste
INSERT INTO alunos VALUES (1, 'Marina', 'F');
INSERT INTO alunos VALUES (2, 'Joana', 'F');


-- consultando as injeções realizadas
SELECT * FROM alunos WHERE matricula=1

-- ATIVIDADE: Crie uma nova tabela chamada 'professores', com a mesma quantidade de características de 'alunos',
-- fazendo ao menos duas injeções de dados e uma consulta.

-- inserindo uma chave estrangeira ao criar uma tabela
-- opção 1: a tabela AINDA NÃO FOI CRIADA:
CREATE TABLE professores (
  matricula_prof INTEGER PRIMARY KEY,
  matricula INT,
  nome_prof TEXT NOT NULL,
  eixo TEXT NOT NULL,
	CONSTRAINT fk_alunos
	FOREIGN KEY (matricula)
	REFERENCES alunos(matricula)
);
-- opção 2: a tabela JÁ FOI CRIADA:
ALTER TABLE alunos
ADD CONSTRAINT professores
FOREIGN KEY (matricula_prof)
REFERENCES professores(matricula_prof);

-- modificando tabelas que já foram criadas no geral:
ALTER TABLE alunos
ADD email_contato VARCHAR (50);

-- ATIVIDADE para avaliar na semana que vem: Criem mais uma tabela que possa ter relação com 'alunos'
-- e 'professores', fazendo pelo menos a construção com 7 atributos e 7 injeções. Não esqueça de 
-- que todas precisam estar relacionadas.

CREATE TABLE disciplinas (
    codigo_disciplina INTEGER PRIMARY KEY
    matricula INT
    matricula_prof INT
    nome_disciplina TEXT NOT NULL
    horário_disciplina TEXT NOT NULL
    dias_disciplina TEXT NOT NULL
    data_inicio TEXT NOT NULL
    data_fim TEXT NOT NULL
    horas_disciplina INT
        CONSTRAINT fk_professores
    	FOREIGN KEY (professores)
    	REFERENCES professores(matricula_prof)
        CONSTRAINT fk_alunos
    	FOREIGN KEY (alunos)
    	REFERENCES alunos(matricula)
         
)

INSERT INTO disciplinas VALUES (001,'Excel avançado', '8h-12h', 'ter/qui','julho/2024','set/2024', 160);
INSERT INTO disciplinas VALUES (002,'Big Data Science', '18h-22h', 'seg/qua/sex','set/2024','dez/2024',240);
INSERT INTO disciplinas VALUES (003,'Python', '18h-22h', 'seg/qua','jan/2024','mar/2024',180)
INSERT INTO disciplinas VALUES (004,'Informática Fundamental', '8h-12h', 'sáb','jun/2024','ago/2024',160);
INSERT INTO disciplinas VALUES (005, 'Programador Full Stack', '13h-17h','seg/qua/sex', 'jan/2025', 'jun/2025', 260)
INSERT INTO disciplinas VALUES (006, 'Google cloud', '8h-12h', 'ter/qui','julho/2024','set/2024', 160)
INSERT INTO disciplinas VALUES (007, 'Inteligência Artificial', '13h-17h', 'ter/qui','julho/2024','out/2024', 180)
