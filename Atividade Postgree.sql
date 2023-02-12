CREATE table aluno(
	id serial PRIMARY KEY,
  	nome VARCHAR(20) NOT NULL,
  	matricula int UNIQUE,
  	email VARCHAR(20) NOT NULL,
  	endereco VARCHAR(20) NOT NULL,
  	telefone VARCHAR(15) NOT NULL
);
CREATE TABLE sessao(
  	codigo serial PRIMARY KEY,
  	descricao VARCHAR(30) NOT NULL,
  	localizacao VARCHAR(20)
);

CREATE TABLE livro(
  	codigo_livro serial PRIMARY KEY,
  	titulo VARCHAR(50) NOT NULL,
  	autor VARCHAR(30) NOT NULL,
  	cod_sessao INT,
  	CONSTRAINT cod_sessao FOREIGN KEY(cod_sessao) REFERENCES sessao(codigo)
);
CREATE TABLE emprestimo(
	codigo serial PRIMARY KEY,
  	data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  	data_devolucao DATE,
  	matric_aluno int,
  	CONSTRAINT matric_aluno FOREIGN KEY(matric_aluno) REFERENCES aluno(matricula)
);
CREATE table livro_emprestimo(
  	cod_livro int,
  	cod_emprestimo int,
  	CONSTRAINT cod_livro FOREIGN KEY(cod_livro) REFERENCES livro(codigo_livro),
  	CONSTRAINT cod_emprestimo FOREIGN KEY(cod_emprestimo) REFERENCES emprestimo(codigo),
  	CONSTRAINT livro_emprestimo_pk PRIMARY KEY(cod_livro,cod_emprestimo)
);

INSERT into aluno(nome,matricula,email,endereco,telefone) VALUES
('João Carlos',1234,'jcarlos@gmail.com','Rua 13 de Maio','(11)7825-4489'),
('João Vitor',2345,'jvitor@gmail.com','Rua da saudade','(11)7825-6589'),
('Paulo Andre',3456,'Pandr@gmail.com','Rua do Sol','(11)7825-4495');

select * from aluno;

INSERT into emprestimo(matric_aluno,data_devolucao) VALUES
(1234,'2022-03-15'),
(3456,'2022-03-18'),
(2345,'2022-03-23');

SELECT * from emprestimo;
SELECT codigo,to_char(data_hora,'DD/MM/YYYY HH:MM') ,to_char(data_devolucao,'DD/MM/YYYY') As devolucao From emprestimo; 

insert into sessao(descricao,localizacao) VALUES
('Sessao 1','Partilheira 1'),
('Sessao 2','Partilheira 2'),
('Sessao 3','Partilheira 3');

SELECT * from sessao;

INSERT INTO livro(titulo,autor,cod_sessao) VALUES
('Modelo Conceitual e Diagramas ER','Pressman,Roger S.',3),
('Livro 2:Modelo Relacional e Algebra Relacional','Heuser,Carlos Alberto',1),
('Livro 3:Linguagem SQL','Beighley,Lynn',2);

SELECT * from livro;

INSERT into livro_emprestimo(cod_livro,cod_emprestimo)VALUES
(3,1),
(1,3),
(2,2);

SELECT * from livro_emprestimo;