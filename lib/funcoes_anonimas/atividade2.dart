/*
Atividade II - Defina 3 funções do mesmo contexto e uma interface para estas funções

-> Interface salário
-> Receber salário e um valor. Bonificar o valor do salário e informar se o 
total é maior que o salário mínimo.
-> Receber salário e um valor. Descontar o valor no salário e informar se 
ainda resta salário a receber.
-> Receber salário e um valor. Calcular e informar porcentagem que o valor 
da comissão representa em relação ao salário.
*/

String verificaSalario(double salario, double valor, {int opcao = 1}) {
  if (opcao == 1) {
    return verificaSalarioMaiorQueMinimo(salario, porcBonus: valor)
        ? 'Salário líquido MAIOR que salário mínimo'
        : 'Salário líquido MENOR que salário mínimo';
  } else if (opcao == 2) {
    return verificaRestaSalarioReceberAposDesconto(salario, valor)
        ? 'Resta salário a receber'
        : 'NÃO resta salário a receber';
  } else if (opcao == 3) {
    return calcularPorcentagemComissao(salario, valor).toString();
  } else {
    throw 'Opção inválida';
  }
}

bool verificaSalarioMaiorQueMinimo(double salario, {double porcBonus = 0}) {
  return aplicarBonificacaoSalario(salario, porcBonus) > 1212;
}

bool verificaRestaSalarioReceberAposDesconto(
    double salario, double porcDesconto) {
  return aplicarDescontoSalario(salario, porcDesconto) > 0;
}

double aplicarBonificacaoSalario(double salario, double porcBonus) {
  if (porcBonus < 0 || porcBonus > 100) {
    throw 'A porcentagem do bonus tem que estar entre 0 e 100';
  }
  return salario + (salario * (porcBonus / 100));
}

double aplicarDescontoSalario(double salario, double porcDesconto) {
  if (porcDesconto < 0 || porcDesconto > 100) {
    throw 'A porcentagem do desconto tem que estar entre 0 e 100';
  }
  return salario - (salario * (porcDesconto / 100));
}

double calcularPorcentagemComissao(double salario, double comissao) {
  return ((salario / comissao) - 1) * 100;
}
