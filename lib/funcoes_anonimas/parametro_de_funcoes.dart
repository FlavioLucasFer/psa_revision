String verificarAprovacao(double nota1, double nota2,
    {Function acao = verificarPelaMedia}) {
  return acao(nota1, nota2);
}

String verificarPelaMedia(double nota1, double nota2) {
  double media = (nota1 + nota2) / 2;

  if (media > 6) {
    return 'aprovado';
  }

  return 'reprovado';
}

String verificarPelaMaiorNota(double nota1, double nota2) {
  double maior = nota1;

  if (nota2 > nota1) {
    maior = nota2;
  }

  if (maior > 6) {
    return 'aprovado';
  }

  return 'reprovado';
}

String verificarPelaMenorNota(double nota1, double nota2) {
  double menor = nota1;

  if (nota2 < nota1) {
    menor = nota2;
  }

  if (menor > 6) {
    return 'aprovado';
  }

  return 'reprovado';
}
