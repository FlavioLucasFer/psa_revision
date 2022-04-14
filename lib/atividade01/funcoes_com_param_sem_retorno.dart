import 'dart:io';

void show() {
  print('Funções sem retorno e com parâmetro');
  // verificarAprovacao(7, 8);
  validaKeyAtivacao('HTM6-8437-DR5U-DR87');
}

void verificarAprovacao(double nota1, double nota2) {
  var media = (nota1 + nota2) / 2;

  print(media >= 6 ? 'aprovado' : 'reprovado');
}

// Atividade I
void calcularSalarioLiquido(double salario, double desconto) {
  if (salario > desconto) {
    salario -= desconto;
  }

  print('Salário líquido: $salario');
}

// Atividade II

// Lista para simular base de dados contendo as keys/chaves válidas
var keys = [
  'HTM6-8437-DR5U-DR87',
  '2THD-654F-54E5-7657',
  'YTFG-YTRJ-UJYG-754G',
];

/* Declaração da função, sem retorno (void) e com 1 parâmetro do tipo String 
chamado 'key' */
void validaKeyAtivacao(String key) {
  /* Escreve na tela que a chave é válida caso a chave esteja contida 
  na base de dados, caso contrário, escreve na tela que a chave é inválida */
  print(keys.contains(key) ? 'chave válida' : 'chave inválida');
}
