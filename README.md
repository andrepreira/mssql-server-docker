inicio do projeto

# Sql Server

/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P password123!

/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P password123! -d master -i '/var/opt/mssql/data/create-database.sql'

/opt/mssql-tools/bin/bcp [product-db].dbo.parentes_incompleto_limpo in '/var/opt/mssql/data/parentes_incompleto_limpo.csv' -S localhost -U sa -P password123! -t; -w -r\\n -r; -F 2

/opt/mssql-tools/bin/bcp [product-db].dbo.parentes in '/var/opt/mssql/data/parentes.csv' -S localhost -U sa -P password123! -t\; -b1000 -r\\n -r '0x0a' -F2

BULK INSERT [product-db].dbo.parentes 
FROM '/var/opt/mssql/data/parentes.csv'
WITH (FIRSTROW = 2, ROWTERMINATOR = '0x0a', DATAFILETYPE = 'char', FIELDQUOTE = '"', FIELDTERMINATOR='\;')

BULK INSERT [product-db].dbo.parentes_incompleto_limpo 
FROM '/var/opt/mssql/data/parentes_incompleto_limpo.csv'
WITH (FIRSTROW = 2, ROWTERMINATOR = '0x0a', DATAFILETYPE = 'char', FIELDQUOTE = '"', FIELDTERMINATOR='\;')


awk 'NR>5391' parentes.csv > tmp.csv && mv tmp.csv parentes.csv

SELECT * FROM [product-db].dbo.parentes_incompleto_limpo ORDER BY CPF OFFSET 50 ROWS FETCH NEXT 5 ROWS ONLY 

DELETE FROM [product-db].dbo.parentes_incompleto_limpo;

/opt/mssql-tools/bin/bcp [product-db].dbo.parentes_incompleto_limpo in '/var/opt/mssql/data/parentes_incompleto_limpo.csv' -S localhost -U sa -P password123! -t; -w -r\\n -r;

BULK INSERT [product-db].dbo.parentes_incompleto_limpo 
FROM '/var/opt/mssql/data/parentes_incompleto_limpo.csv'
WITH (FIRSTROW = 2, MAXERRORS = 10000, BATCHSIZE = 100000, ROWTERMINATOR = '0x0a', 
FORMAT = 'CSV', FIELDTERMINATOR='\;', KEEPNULLS)

/opt/mssql-tools/bin/bcp [product-db].dbo.parentes in '/var/opt/mssql/data/parentes_limpo.csv' -S localhost -U sa -P password123! -t; -w -r\\n -r;

BULK INSERT [product-db].dbo.parentes 
FROM '/var/opt/mssql/data/parentes_limpo.csv'
WITH (BATCHSIZE = 100000, ROWTERMINATOR = '0x0a', DATAFILETYPE = 'char', FIELDQUOTE = '"', FIELDTERMINATOR='\;')


# psql

CREATE TABLE parentes  (
     CPF  varchar(255) null,
     NOME  varchar(255) null,
     NOME_VINCULO  varchar(255) null,
     CPF_VINCULO_9  varchar(255) null,
     VINCULO  varchar(255) null,
     CPF_Completo  varchar(255) null,
     CPF_VINCULO  varchar(255) null
  );


COPY parentes(CPF,NOME,NOME_VINCULO,CPF_VINCULO_9,VINCULO,CPF_Completo,CPF_VINCULO)
FROM '/home/andre/base_relacionamento/parentes_limpo.csv'
DELIMITER ';'
CSV HEADER;