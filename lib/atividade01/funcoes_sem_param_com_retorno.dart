import 'dart:io';

void show() {
  print('Funções com retorno e sem parâmetro');
  // var resultado = verificarAprovacao();
  // print(resultado);
  var chaveEhValida = validaKeyAtivacao();
  print(chaveEhValida ? 'chave válida' : 'chave inválida');
}

String verificarAprovacao() {
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

  return media >= 6 ? 'aprovado' : 'reprovado';
}

// Atividade I
double calcularSalarioLiquido() {
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

  return salario > desconto ? salario - desconto : salario;
}

// Atividade II

// Lista para simular base de dados contendo as keys/chaves válidas
var keys = [
  'HTM6-8437-DR5U-DR87',
  '2THD-654F-54E5-7657',
  'YTFG-YTRJ-UJYG-754G',
];

// Declaração da função, com retorno do tipo bool e sem parâmetros
bool validaKeyAtivacao() {
  // Mensagem exibida antes de solicitar input do usuário para orientá-lo
  print('Informe a key: ');
  // Coletando input do usuário com função readLineSync da biblioteca stdin
  var inputKey = stdin.readLineSync();

  /* Se o input não for nulo e a chave estiver contida na base de dados 
  de chaves válidas... */
  if (inputKey != null && keys.contains(inputKey.toString())) {
    // ... então a função retorna 'true', indicando que a key é válida
    return true;
  } 

  // ... senão, a função retorna 'false', indicando que a key é inválida
  return false;
}
