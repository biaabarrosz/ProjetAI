CREATE TABLE Cliente (
    cpf_cliente VARCHAR(14) PRIMARY KEY
);

CREATE TABLE Mesa (
    num_mesa INT PRIMARY KEY,
    num_pratos INT,
    num_pessoas INT,
    status VARCHAR(20)
);

CREATE TABLE Comanda (
    id_comanda INT PRIMARY KEY,
    num_mesa INT,
    horario_inicio DATETIME,
    horario_fim DATETIME,
    cpf_cliente VARCHAR(14),
    id_funcionario INT,
    FOREIGN KEY (num_mesa) REFERENCES Mesa(num_mesa),
    FOREIGN KEY (cpf_cliente) REFERENCES Cliente(cpf_cliente)
);

CREATE TABLE Funcionario (
    id_funcionario INT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE Comanda_Funcionario (
    id_comanda INT,
    id_funcionario INT,
    PRIMARY KEY (id_comanda, id_funcionario),
    FOREIGN KEY (id_comanda) REFERENCES Comanda(id_comanda),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario)
);
INSERT INTO Cliente (cpf_cliente) VALUES ('123.456.789-10');
INSERT INTO Cliente (cpf_cliente) VALUES ('987.654.321-00');

INSERT INTO Mesa (num_mesa, num_pratos, num_pessoas, status) VALUES (1, 4, 2, 'Disponível');
INSERT INTO Mesa (num_mesa, num_pratos, num_pessoas, status) VALUES (2, 6, 4, 'Ocupada');

INSERT INTO Funcionario (id_funcionario, nome, telefone) VALUES (1, 'João Silva', '123456789');
INSERT INTO Funcionario (id_funcionario, nome, telefone) VALUES (2, 'Maria Souza', '987654321');

INSERT INTO Comanda (id_comanda, num_mesa, horario_inicio, horario_fim, cpf_cliente, id_funcionario) VALUES (1, 1, '2024-05-20 12:00:00', '2024-05-20 13:30:00', '123.456.789-10', 1);
INSERT INTO Comanda (id_comanda, num_mesa, horario_inicio, horario_fim, cpf_cliente, id_funcionario) VALUES (2, 2, '2024-05-20 13:00:00', NULL, '987.654.321-00', 2);

INSERT INTO Comanda_Funcionario (id_comanda, id_funcionario) VALUES (1, 1);
INSERT INTO Comanda_Funcionario (id_comanda, id_funcionario) VALUES (2, 2);

SELECT * FROM Mesa WHERE status = 'Ocupada';

SELECT c.id_comanda, m.num_mesa, c.horario_inicio, c.horario_fim, cl.cpf_cliente, f.nome AS nome_funcionario
FROM Comanda c
JOIN Mesa m ON c.num_mesa = m.num_mesa
LEFT JOIN Cliente cl ON c.cpf_cliente = cl.cpf_cliente
JOIN Comanda_Funcionario cf ON c.id_comanda = cf.id_comanda
JOIN Funcionario f ON cf.id_funcionario = f.id_funcionario;





