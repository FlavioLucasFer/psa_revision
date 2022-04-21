/*
Atividade III
Pensar em um projeto único 
Fazer um exemplo seu
*/

// Personagem do jogo
class Personagem {
  double vida = 1000;
  double armadura = 32;
  double resistenciaMagica = 12;
  double multiplicadorMaldicao = 0;
}

/* Calcula o dano recebido
O calculo do dano recebido pode ser de diversos tipos, por exemplo: dano físico
recebido, dano mágico recebido, etc.
*/
double calcularDanoRecebido(double dano, Personagem personagem,
    {double multiplicador = 0, Function acao = calcularDanoFisico}) {
  return acao(dano, personagem, {multiplicador});
}

// Calcula o dano físico recebido
double calcularDanoFisico(double dano, Personagem personagem,
    {double multiplicador = 0}) {
  // Subtrai do dano aplicado a quantidade de armadura do personagem
  return (dano - personagem.armadura) *
      // multiplica pelo multiplicador de maldição que o personagem acumula
      personagem.multiplicadorMaldicao *
      // multiplica pelo multiplicador de dano
      multiplicador;
}

// Calcula o dano mágico recebido
double calcularDanoMagico(double dano, Personagem personagem,
    {double multiplicador = 0}) {
  // Subtrai do dano aplicado a quantidade de resistência mágica do personagem                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    do personagem
  return (dano - personagem.resistenciaMagica) *
      // multiplica pelo multiplicador de maldição que o personagem acumula
      personagem.multiplicadorMaldicao *
      // multiplica pelo multiplicador de dano
      multiplicador;
}

// Calcula o dano mágico recebido
double calcularDanoSangramento(double dano, Personagem personagem,
    {double multiplicador = 0}) {
  // Subtrai do dano aplicado 15% da armadura do personagem
  return (dano - (personagem.armadura * .15)) *
      // multiplica pelo multiplicador de maldição que o personagem acumula
      personagem.multiplicadorMaldicao *
      // multiplica pelo multiplicador de dano
      multiplicador;
}

var danoRecebido = calcularDanoRecebido(
  200,
  Personagem(),
  // aplicação de dano divino
  acao: (dano, personagem) => dano + (personagem.multiplicadorMaldicao * 1.64),
);
