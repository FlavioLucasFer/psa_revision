import 'dart:io';

void main() {
  // Atividade II → Realize as atividades abaixo

  //Exercício 1 - faça a chamada do método adicionarSalario validando se o valor é positivo.
  adicionarSalario(2000, 500, ePositivo);

  //Exercício 2 - refaça o exe anterior, convertendo a named function em anonymous function.
  adicionarSalario(2000, 500, (valor) {
    return ePositivo(valor);
  });

  //Exercício 3  - refaça o exe anterior, utilizando a arrow function.
  adicionarSalario(2000, 500, (valor) => ePositivo(valor));

  //Exercício 4  - refaça os exe's a, b e c, porém validando se o valor é menor do que o salário.
  /*
  Este exercício não é possível ser feito pois a função 'hospedeira' passa
  para a função de parâmetro apenas o valor, porém, para a validação solicitada
  seria necessário que a função de parâmetro recebesse da 'hospedeira' salário e
  valor.
  */

  //Exercício 5  - refaça o exe c porém fazendo uma validação sua.
  // valida se o número é ímpar
  adicionarSalario(2000, 500, (valor) => valor % 2 != 0);

  //Exercício 6 - faça 2 exemplos do uso de funções anônimas utilizando a biblioteca do dart.
  var notas = [
    67.5,
    70.3,
    55.0,
    44.8,
  ];
  double total = 0;
  // função anônima
  notas.forEach((nota) {
    total += nota;
  });
  var media = total / notas.length;
  print(media > 60 ? 'Aprovado!' : 'Reprovado!');

  notas = [
    67.5,
    70.3,
    55.0,
    63.3,
  ];
  total = 0;
  // arrow function
  notas.forEach((nota) => total += nota);
  media = total / notas.length;
  print(media > 60 ? 'Aprovado!' : 'Reprovado!');

  /*
  Exercício 6 - Conseguiu entender:
    - O contexto em que é útil utilizar funções anônimas?

    Quando precisamos realizar um procedimento simples e bastante específico
    evidenciando não ser necessário criar uma função nomeada já que a 
    funcionalidade dificilmente será utilizada em outra parte do código fonte.

    - Os requisitos necessários para usar funções anônimas? 

    Para utilizar uma função anônima é necessário que a função que hospedará
    a função anônima possa receber como parâmetro uma função. Além disso, é 
    necessário que a função anônima possua sintaxe correta, seja função anônima,
    seja arrow function. A sintaxe de ambas abordagens é explicada na questão
    seguinte.

    - diferença entre função nomeada e anônimas?

    Funções nomeadas são funções que possuem um nome e portanto são escritas
    uma vez e podem ser chamadas em diversas partes do código fonte, 
    a estrutura básica para uma função nomeada é:
    
    tipoRetorno nomeFunçao([parametros]) {
      ... (bloco de código)
    }

    Vale ressaltar que funções nomeadas só são executadas quando chamadas, e não
    quando escritas ou declaradas.

    Funções anônimas são funções sem nome, portanto uma função anônima escrita
    em um local do código não pode ser chamada em outro pois não possui nome. 
    Além disso, funções anônimas são executadas assim que declaradas e são 
    comumente utilizadas como parâmetros de funções que aceitam função como
    parâmetro. A estrutura básica de uma função anônima é:

    ([parametros]) {
      ... (bloco de código)
    }

    - diferença entre anonymous function e arrow function?
    
    Uma arrow function é uma função anônima com notação simplificada para casos
    onde a função anônima contém um único comando ou expressão. A estrutura 
    básica de uma arrow function é:

    ([parametros]) => comando/expressão

    Vale salientar que arrow functios possuem retorno implícito, ou seja, todas
    as arrow function retornam o resultado de seu comando/expressão.

    Em que caso devemos utilizar Arrow Function? O que devemos considerar?

    Em casos onde podemos escrever a função anônima em um único comandoou 
    expressão. Por exemplo:

    (idade) {
      if (idade > 18) return true;
      return false;
    }

    A função anônima acima poderia ser escrita de forma mais simples e fácil 
    de entender/manutenir caso fosse escrita como uma arrow function:

    (idade) => idade > 18

  */
}

void adicionarSalario(
    double salario, double valor, Function(double valor) validacao) {
  final eValido = validacao(valor);
  if (eValido) {
    final total = salario + valor;
    print(total);
  }
}

bool ePositivo(double numero) {
  if (numero > 0) {
    return true;
  } else {
    return false;
  }
}
