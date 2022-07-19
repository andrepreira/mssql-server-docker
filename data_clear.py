import csv

path = "../base_relacionamento/"

file = path + "parentes_incompleto.csv"

new_file = open(path + "parentes_incompleto_limpo.csv", 'w+')

writer_new_file = csv.writer(new_file)

def fix_nulls(s):
    for line in s:
        yield line.replace('\x00', '')

# nome colunas => CPF', 'NOME', 'NOME_VINCULO', 'CPF_VINCULO_9', 'VINCULO', 'CPF_Completo', 'CPF_VINCULO'
with open(file, encoding="latin-1") as csvfile:
    reader = csv.reader(fix_nulls(csvfile), delimiter= ';')
    count = 0
    for row in reader:
        count+=1
        if count >= 5392:
            print(row, count)
            writer_new_file.writerow(row)
