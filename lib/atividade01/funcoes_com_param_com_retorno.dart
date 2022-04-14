import 'dart:io';

void show() {
  print('Funções com retorno e com parâmetro');
  // var resultado = verificarAprovacao(7, 8);
  // print(resultado);
  var chaveEhValida = validaKeyAtivacao('HTM6-0997-97RU-D987');
  print(chaveEhValida ? 'chave válida' : 'chave inválida');
}

String verificarAprovacao(double nota1, double nota2) {
  var media = (nota1 + nota2) / 2;

  return media >= 6 ? 'aprovado' : 'reprovado';
}

// Atividade I
double calcularSalarioLiquido(double salario, double desconto) {
  return salario > desconto ? salario - desconto : salario;
}

// Atividade II

// Lista para simular base de dados contendo as keys/chaves válidas
var keys = [
  'HTM6-8437-DR5U-DR87',
  '2THD-654F-54E5-7657',
  'YTFG-YTRJ-UJYG-754G',
];

/* Declaração da função, com retorno do tipo bool 
e com 1 parâmetro do tipo String chamado 'key' */
bool validaKeyAtivacao(String key) {
  /* O método 'contains' da classe de lista do Dart retorna um booleano.
  'true' caso o argumento esteja contido na lista ou 'false' caso contrário.
  Portanto, caso a key seja válida, ou seja, esteja contida na base de dados
  será retornado o booleano 'true', caso contrário será retornado 'false'*/
  return keys.contains(key);
}
