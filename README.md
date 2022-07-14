inicio do projeto

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

SELECT * FROM [product-db].dbo.parentes_incompleto_limpo ORDER BY CPF OFFSET 50 ROWS FETCH NEXT 100 ROWS ONLY 

awk 'NR>5391' parentes.csv > tmp.csv && mv tmp.csv parentes.csv