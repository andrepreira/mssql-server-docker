path = "../base_relacionamento/"

file = "parentes.csv"

new_file = "parentes_limpo.csv"

with open(path + file, encoding='latin-1')\
    as arquivo, open(path + new_file, 'w+') as arquivo_limpo:
    for ix, linha in enumerate(arquivo):
        if ix > 5931:
            arquivo_limpo.write(linha.replace('\x00', ''))

print('Fim da limpeza de dados!!')