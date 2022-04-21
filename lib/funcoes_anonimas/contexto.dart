// contexto

String verificarAprovacaoCompleto(double nota1, double nota2, {int opcao = 1}) {
  if (opcao == 1) {
    double media = (nota1 + nota2) / 2;

    if (media > 6) {
      return 'aprovado';
    }

    return 'reprovado';
  } else if (opcao == 2) {
    double maior = nota1;

    if (nota2 > nota1) {
      maior = nota2;
    }

    if (maior > 6) {
      return 'aprovado';
    }

    return 'reprovado';
  } else if (opcao == 3) {
    double menor = nota1;

    if (nota2 < nota1) {
      menor = nota2;
    }

    if (menor > 6) {
      return 'aprovado';
    }

    return 'reprovado';
  } else {
    return 'ERR: OPÇÃO INVÁLIDA';
  }
}

String verificarAprovacao(double nota1, double nota2, {int opcao = 1}) {
  if (opcao == 1) {
    return verificarPelaMedia(nota1, nota2);
  } else if (opcao == 2) {
    return verificarPelaMaiorNota(nota1, nota2);
  } else if (opcao == 3) {
    return verificarPelaMenorNota(nota1, nota2);
  } else {
    return 'ERR: OPÇÃO INVÁLIDA';
  }
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
