/*Cria a database*/
CREATE DATABASE tutorial;
/*Define que o schema tutorial será utilizado*/
USE tutorial;

/*Cria a tabela*/
CREATE TABLE IF NOT EXISTS tabela (
	PostalCode INT NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    LastNome VARCHAR(50) NOT NULL,
    SalesYTD DOUBLE NOT NULL
);

/*Mostra a tabela*/
SHOW TABLES;

/*Insere dados na tabela*/
INSERT INTO tabela
(PostalCode,
Nome,
LastNome,
SalesYTD)
VALUES
(98027,
'Tsvi',
'Reiter',
2811012.7151);

INSERT INTO tabela
(PostalCode,
Nome,
LastNome,
SalesYTD)
VALUES
(98055,
'Rachel',
'Valdez',
2241204.0424);

INSERT INTO tabela
(PostalCode,
Nome,
LastNome,
SalesYTD)
VALUES
(98055,
'José',
'Saraiva',
3189356.2465);

INSERT INTO tabela
(PostalCode,
Nome,
LastNome,
SalesYTD)
VALUES
(98055,
'Shu',
'Ito',
3018725.4858);

INSERT INTO tabela
(PostalCode,
Nome,
LastNome,
SalesYTD)
VALUES
(98027,
'Michael',
'Blythe',
4557045.0459);

INSERT INTO tabela
(PostalCode,
Nome,
LastNome,
SalesYTD)
VALUES
(98055,
'Ranjit',
'Varkey Chudukatil',
3827950.238);

INSERT INTO tabela
(PostalCode,
Nome,
LastNome,
SalesYTD)
VALUES
(98055,
'Lynn',
'Tsoflias',
2241204.0424);

INSERT INTO tabela
(PostalCode,
Nome,
LastNome,
SalesYTD)
VALUES
(98055,
'Davi',
'Campbell',
3587378.4257);

INSERT INTO tabela
(PostalCode,
Nome,
LastNome,
SalesYTD)
VALUES
(98027,
'Jillian',
'Carson',
3857163.6332);

INSERT INTO tabela
(PostalCode,
Nome,
LastNome,
SalesYTD)
VALUES
(98027,
'Garrett',
'Vargas',
1764938.9859);

INSERT INTO tabela
(PostalCode,
Nome,
LastNome,
SalesYTD)
VALUES
(98055,
'Jae',
'Pak',
5015682.3752);

INSERT INTO tabela
(PostalCode,
Nome,
LastNome,
SalesYTD)
VALUES
(98055,
'Tete',
'Reiter',
1931620.1835);

INSERT INTO tabela
(PostalCode,
Nome,
LastNome,
SalesYTD)
VALUES
(98027,
'Linda',
'Mitchell',
5200475.2313);
/*Fim inserção de dados na tabela*/

/*Inicio Transact-SQL*/

/*Classifica através do PostalCode*/
SELECT 
	Nome,
    LastNome,
	ROW_NUMBER () OVER (ORDER BY PostalCode ASC) AS RowNumber,
	RANK () OVER (ORDER BY PostalCode ASC) AS Vendas_Rank,
	DENSE_RANK () OVER (ORDER BY PostalCode ASC) AS DenseRank,
	NTILE (4) OVER (ORDER BY PostalCode ASC) AS Ntile_rank,
    SalesYTD,
    PostalCode
FROM tutorial.tabela;

/*Classifica através do SalesYTD*/
SELECT 
	Nome,
    LastNome,
	ROW_NUMBER () OVER (ORDER BY SalesYTD ASC) AS RowNumber,
	RANK () OVER (ORDER BY SalesYTD ASC) AS Vendas_Rank,
	DENSE_RANK () OVER (ORDER BY SalesYTD ASC) AS DenseRank,
	NTILE (4) OVER (ORDER BY SalesYTD ASC) AS Ntile_rank,
    SalesYTD,
    PostalCode
FROM tutorial.tabela;

/*Classifica através do PostalCode E depois pelo SalesYTD*/    
SELECT 
	Nome,
    LastNome,
	ROW_NUMBER () OVER (ORDER BY PostalCode, SalesYTD ASC) AS RowNumber,
    RANK () OVER (ORDER BY PostalCode, SalesYTD ASC) AS Vendas_Rank,
	DENSE_RANK () OVER (ORDER BY PostalCode, SalesYTD ASC) AS DenseRank,
	NTILE (4) OVER (ORDER BY PostalCode, SalesYTD ASC) AS Ntile_rank,
    SalesYTD,
    PostalCode
FROM tutorial.tabela;
