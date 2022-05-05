import 'ver_aprovacao/verificar_aprovacao.dart' as aprovacao;

void show() {
  double nota1;
  double nota2;
  double media;
  int quantidadePresenca;
  int cargaHorariaDisciplina;
  double percentualMinimoPresenca;
  String resultado;

  /* 
  Contexto de teste I -> Aprovado por nota e aprovado por falta
  Entradas: [
    nota1: 7.0, 
    nota2: 8.0, 
    media: 7.0, 
    quantidadePresenca: 70, 
    cargaHorariaDusciplina: 80, 
    percentualMinimoPresenca: 75.0
  ]
  Saída esperada: Aprovado
  */
  nota1 = 7.0;
  nota2 = 8.0;
  media = 7.0;
  quantidadePresenca = 70;
  cargaHorariaDisciplina = 80;
  percentualMinimoPresenca = 75.0;
  resultado = aprovacao.verificarAprovacao(nota1, nota2, media,
      quantidadePresenca, cargaHorariaDisciplina, percentualMinimoPresenca);

  print("""
Contexto de teste I -> Aprovado por nota e aprovado por falta
Entradas: [
  nota1: 7.0, 
  nota2: 8.0, 
  media: 7.0, 
  quantidadePresenca: 70, 
  cargaHorariaDusciplina: 80, 
  percentualMinimoPresenca: 75.0
]
Saída esperada: Aprovado
Saída: ${resultado} 
""");

  /* 
  Contexto de teste II -> Reprovado por nota e aprovado por falta
  Entradas: [
    nota1: 5.0, 
    nota2: 8.0, 
    media: 7.0, 
    quantidadePresenca: 70, 
    cargaHorariaDusciplina: 80, 
    percentualMinimoPresenca: 75.0
  ]
  Saída esperada: Reprovado por nota
  */
  nota1 = 5.0;
  nota2 = 8.0;
  media = 7.0;
  quantidadePresenca = 70;
  cargaHorariaDisciplina = 80;
  percentualMinimoPresenca = 75.0;
  resultado = aprovacao.verificarAprovacao(nota1, nota2, media,
      quantidadePresenca, cargaHorariaDisciplina, percentualMinimoPresenca);

  print("""
Contexto de teste II -> Reprovado por nota e aprovado por falta
Entradas: [
  nota1: 5.0, 
  nota2: 8.0, 
  media: 7.0, 
  quantidadePresenca: 70, 
  cargaHorariaDusciplina: 80, 
  percentualMinimoPresenca: 75.0
]
Saída esperada: Reprovado por nota
Saída: ${resultado} 
""");

  /* 
  Contexto de teste III -> Aprovado por nota e reprovado por falta
  Entradas: [
    nota1: 9.0, 
    nota2: 5.0, 
    media: 6.5, 
    quantidadePresenca: 100, 
    cargaHorariaDusciplina: 144, 
    percentualMinimoPresenca: 85.0
  ]
  Saída esperada: Reprovado por falta
  */
  nota1 = 9.0;
  nota2 = 5.0;
  media = 6.5;
  quantidadePresenca = 100;
  cargaHorariaDisciplina = 144;
  percentualMinimoPresenca = 85.0;
  resultado = aprovacao.verificarAprovacao(nota1, nota2, media,
      quantidadePresenca, cargaHorariaDisciplina, percentualMinimoPresenca);

  print("""
Contexto de teste III -> Aprovado por nota e reprovado por falta
Entradas: [
  nota1: 9.0, 
  nota2: 5.0, 
  media: 6.5, 
  quantidadePresenca: 100, 
  cargaHorariaDusciplina: 144, 
  percentualMinimoPresenca: 85.0
]
Saída esperada: Reprovado por falta
Saída: ${resultado} 
""");

  /* 
  Contexto de teste IV -> Reprovado por nota e reprovado por falta
  Entradas: [
    nota1: 5.0, 
    nota2: 8.0, 
    media: 7.5, 
    quantidadePresenca: 30, 
    cargaHorariaDusciplina: 90, 
    percentualMinimoPresenca: 70.0
  ]
  Saída esperada: Reprovado por nota
  */
  nota1 = 8.0;
  nota2 = 5.0;
  media = 7.5;
  quantidadePresenca = 30;
  cargaHorariaDisciplina = 90;
  percentualMinimoPresenca = 70.0;
  resultado = aprovacao.verificarAprovacao(nota1, nota2, media,
      quantidadePresenca, cargaHorariaDisciplina, percentualMinimoPresenca);

  print("""
Contexto de teste IV -> Reprovado por nota e reprovado por falta
Entradas: [
  nota1: 8.0, 
  nota2: 5.0, 
  media: 7.5, 
  quantidadePresenca: 30, 
  cargaHorariaDusciplina: 90, 
  percentualMinimoPresenca: 70.0
]
Saída esperada: Reprovado por falta
Saída: ${resultado} 
""");
}

/*
Esta função tem o objetivo de verificar a aprovação pela nota e presença 
Considerando este cenário, quais são os possíveis contextos de teste? 

Contexto I: aprovado por nota e aprovado por falta;
Contexto II: reprovado por nota e aprovado por falta;
Contexto III: aprovado por nota e reprovado por falta;
Contexto IV: reprovado por nota e reprovado por falta;

Para cada cenário, os resultados gerados estão coerentes?

Contexto I -> Coerente
Contexto II -> Incoerente
Contexto III -> Incoerente
Contexto IV -> Coerente

Registros os erros encontrados e faça as alterações necessárias.

ERRO 1 -> A função verificarAprovacaoNota recebe a média como parâmetro
opcional e a função verificarAprovacao não está passando argumento para
o parâmetro media da função verificarAprovacaoNota que está 
definindo media = 0 quando o parametro não possui argumento.

ERRO 2 -> A função calcularMedia chama duas funções, calcularNota1 e calcularNota2, 
para calcular nota1 e nota2. Porém essas funções estão alterando o 
valor da nota para 0 e multiplicando 0 por 4 e 6, respectivamente. 
As função são desnecessárias e completamente erradas.

ERRO 3 -> A chamada da função verificarAprovacaoPresenca está passando como 
argumento do parâmetro percentualMinimoPresenca o valor 60 ao invés de o valor
recebido em seu parâmetro de mesmo nome.

ERRO 4 -> O cálculo de percentual realizado pela função calcularPercentualPresenca
está errado. O calculo presente na função é (x * 100) / y quando deveria ser
(x / y) * 100.

ERRO 5 -> O resultado da reprovação por falta está "reprovado por nota"
quando deveria ser "reprovado por falta".

Coerência dos testes após as correções:

Contexto I -> Coerente
Contexto II -> Coerente
Contexto III -> Coerente
Contexto IV -> Coerente

*/

void main() {
  show();
}
