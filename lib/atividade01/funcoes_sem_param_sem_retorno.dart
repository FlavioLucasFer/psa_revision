import 'dart:io';

void show() {
  print('Funções sem retorno e sem parâmetro');
  // verificarAprovacao();
  validaKeyAtivacao();
}

void verificarAprovacao() {
  print("Nota 1: ");
  var inputNota1 = stdin.readLineSync();
  print("Nota 2: ");
  var inputNota2 = stdin.readLineSync();
  double nota1;
  double nota2;

  if (inputNota1 != null) {
    nota1 = double.parse(inputNota1);
  } else {
    nota1 = .0;
  }

  if (inputNota2 != null) {
    nota2 = double.parse(inputNota2);
  } else {
    nota2 = .0;
  }

  var media = (nota1 + nota2) / 2;

  print(media >= 6 ? 'aprovado' : 'reprovado');
}

/*
Atividade I
-> descontar - receber salário e o valor do desconto

Descontar somente se haver saldo.
No final informar o saldo.
*/

void calcularSalarioLiquido() {
  print('Salário: ');
  var inputSalario = stdin.readLineSync();
  print('Desconto: ');
  var inputDesconto = stdin.readLineSync();
  double salario;
  double desconto;

  if (inputSalario != null) {
    salario = double.parse(inputSalario);
  } else {
    salario = .0;
  }

  if (inputDesconto != null) {
    desconto = double.parse(inputDesconto);
  } else {
    desconto = .0;
  }

  if (salario > desconto) {
    salario -= desconto;
  }

  print('Salário líquido: $salario');
}

/*
Atividade II
Pensar em um projeto único - quanto maior o escopo melhor
Fazer um exemplo seu
Fazer comentários de tudo que entendeu 
*/

// Lista para simular base de dados contendo as keys/chaves válidas
var keys = [
  'HTM6-8437-DR5U-DR87',
  '2THD-654F-54E5-7657',
  'YTFG-YTRJ-UJYG-754G',
];

// Declaração da função, sem retorno (void) e sem parâmetros
void validaKeyAtivacao() {
  // Mensagem exibida antes de solicitar input do usuário para orientá-lo
  print('Informe a key: ');
  // Coletando input do usuário com função readLineSync da biblioteca stdin
  var inputKey = stdin.readLineSync();

  /* Se o input não for nulo e a chave estiver contida na base de dados 
  de chaves válidas... */
  if (inputKey != null && keys.contains(inputKey.toString())) {
    // ... então escreve na tela que a chave é válida
    print('chave válida');
  } else {
    // ... senão, escreve na tela que a chave é inválida
    print('chave inválida');
  }
}
