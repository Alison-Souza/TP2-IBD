import pprint

def master_blaster():
  # populate_partido()
  # print_all('Partido')
  partidos = set()
  with open('Candidatos.sql', 'r', encoding='utf-8') as f:
    while True:
      s = f.readline()
      if len(s) == 0:
        break
      if s[-1] == '\n':
        s = s[:-1]
      partidos.add(s.split(', ')[2][1:-1])
      print(s.split(', ')[2][1:-1])
      # insert('Candidato', s)
    # print(s.split(', '))
  pprint.pprint(partidos)

def check_this_donate_modafoca():
  cpf_cnpj = set()
  cpf_test = set()
  with open('Doador.txt', 'r', encoding='utf-8') as f:
    while True:
      s = f.readline()
      if len(s) == 0:
        break
      if s[-1] == '\n':
        s = s[:-1]
      # s = s[len('insert into Doador values')+1:-2].replace("\'", "").split(', ')
      s = s.split('\t')
      if s[0] in cpf_test:
        continue
      else:
        cpf_cnpj.add(tuple(s))
        cpf_test.add(s[0])
  w = open('Doador.sql', 'w')
  w.write('use ibd_tp;\ndelete from Doador;\n')
  for foo in cpf_cnpj:
    w.write('insert into Doador values')
    w.write(str(foo))
    w.write(';\n')
  w.close()

def frank_underwood_talk_to_you():
  doantion = set()
  with open('Doacao_Partido.txt', 'r', encoding='utf-8') as f:
    while True:
      s = f.readline()
      if len(s) == 0:
        break
      if s[-1] == '\n':
        s = s[:-1]
      s = s.split('\t')
      doantion.add(tuple(s))

  w = open('Doacao_Partido.sql', 'w')
  w.write('use ibd_tp;\ndelete from Doacao_Partido;\n')
  for foo in doantion:
    foo = list(foo)
    w.write('insert into Doacao_Partido values(')
    foo[6] = "STR_TO_DATE('" + foo[6] + "', '%d/%m/%Y')"
    if foo[7].find(',') >=0:
      foo[7] = foo[7].replace(',', '.')
    response = str()
    for x in foo:
      if x.find('STR_TO_DATE') >= 0:
        response += str(x)
        response += ', '
      else:
        response += '\''
        response += str(x)
        response += '\', '

    response = response[:-2]
    w.write(response)
    w.write(');\n')
  w.close()

def main():
  # check_this_donate_modafoca()
  frank_underwood_talk_to_you()


if __name__ == '__main__':
  main()