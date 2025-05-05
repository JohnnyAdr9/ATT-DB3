
CREATE DATABASE EleicaoDB;
USE EleicaoDB;

CREATE TABLE Localidade (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(100),
    estado VARCHAR(2)
);

CREATE TABLE Zona (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero INT,
    localidade_id INT,
    FOREIGN KEY (localidade_id) REFERENCES Localidade(id)
);

CREATE TABLE Secao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero INT,
    zona_id INT,
    FOREIGN KEY (zona_id) REFERENCES Zona(id)
);


INSERT INTO Localidade (nome, cidade, estado) VALUES
('Escola Central', 'Belo Horizonte', 'MG'),
('Colégio Estadual', 'Contagem', 'MG'),
('Faculdade ABC', 'Betim', 'MG'),
('Escola Técnica', 'Sabará', 'MG'),
('Centro Educacional', 'Nova Lima', 'MG');


INSERT INTO Zona (numero, localidade_id) VALUES
(101, 1),
(102, 2),
(103, 3),
(104, 4),
(105, 5);

INSERT INTO Secao (numero, zona_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);



UPDATE Localidade SET nome = 'Escola Central Atualizada' WHERE id = 1;
UPDATE Secao SET numero = 10 WHERE id = 2;



DELETE FROM Secao WHERE id = 5;
DELETE FROM Localidade WHERE id = 5;



SELECT * FROM Localidade WHERE estado = 'MG' ORDER BY cidade;


SELECT s.* FROM Secao s
JOIN Zona z ON s.zona_id = z.id
WHERE z.numero = 101
ORDER BY s.numero;

