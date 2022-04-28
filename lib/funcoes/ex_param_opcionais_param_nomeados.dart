void main() {}

// Duas funções com parâmetros opcionais (valor padrão);

double calculaFrete(double distanciaEmKm, [double valorFrete = 0]) {
  return valorFrete * ((distanciaEmKm / 250) * .05);
}

double calculaGastoGasolina(double distanciaEmKm,
    [double ValorGasolina = 7, double kmPorLitro = 5]) {
  return (distanciaEmKm / kmPorLitro) * ValorGasolina;
}

class User {
  late String username;
  late String senha;

  // Uma função com parâmetros nomeados obrigatórios;
  User({required String username, required String senha});

  // Uma função com parâmetros nomeados opcionais;
  criaUsuarioPadrao({String username = '', String senha = ''}) {
    this.username = username;
    this.senha = senha;
  }
}

// Uma função com parâmetros nomeados obrigatórios e opcionais;

bool validaSenhaSemCriptgrafar(String senhaBase, String senhaInput) {
  return senhaBase == senhaInput;
}

bool validaSenhaUsuario(
    {required String senhaUsuario,
    required String senhaInput,
    bool Function(String senhaUsuario, String senhaInput) metodoCriptografia =
        validaSenhaSemCriptgrafar}) {
  return metodoCriptografia(senhaUsuario, senhaInput);
}

// Uma única função com parâmetros nomeados e anônimos;

bool validaSenhaUsuarioParamAnonimo(String senhaUsuario, String senhaInput,
    {bool Function(String senhaUsuario, String senhaInput) metodoCriptografia =
        validaSenhaSemCriptgrafar}) {
  return metodoCriptografia(senhaUsuario, senhaInput);
}

/*
1) Em que caso os parâmetros nomeados são úteis?

Em casos onde a função possui muitos parâmetros. Nomeando-os facilita a 
utilização da função, não obrigando o usuário da função a lembrar de todos 
os parâmetros e da ordem dos parâmetros.

2) Por padrão os parâmetros nomeados são opcionais ou obrigatórios? Caso sejam opcionais, como torná-los obrigatórios?

Por padrão parâmetros nomeados são opcionais. Para torná-los obrigatórios basta
colocar a palavra-chave 'required' antes de cada declaração de tipo de cada
parâmetro nomeado que deve ser obrigatório. Exemplo:

bool func({required double param1, required double param2}) {
  ... (bloco de código)
}

3) Qual a sintaxe para fazer a chamada de uma função com os parâmetros nomeados? 

Para fazer a chamada de uma função com parâmetros nomeados é preciso indicar
o nome do parâmetro, acrescido de dois pontos (:), antes de dar o valor do 
parâmetro. Lembrando que respeitar a ordem dos parâmetros não é necessário.
ex1:

func(param1: 67, param2: 55);
func(param2: 55, param1: 67);

4) É possível definir uma única função com parâmetros nomeados e anônimos?

Sim, funções podem possuir parâmetros nomeados e anônimos simultâneamente. Ex:

bool func(double param1, { required double param2 }) {
  ... (bloco de código)
}

5) Quais são as vantagens em utilizar parâmetros nomeados? 

  * Não precisar lembrar cada parâmetro da função
  * Não precisar respeitar a ordem dos parâmetros
  * Ajuda na compreensão do código 

6) Quais são as diferenças entre parâmetros nomeados e anônimos?

Parâmetros anônimos:

  * Por padrão são obrigatórios
  * Precisam que a ordem em que foram declarados seja respeitada
  * Dificulta a compreensão do uso da função por quem não conhece a função
  * Diminuem a verbosidade da chamada de função

Parâmetros nomeados:

  * Por padrão são opcionais
  * Não precisam que a ordem em que foram declarados seja respeitada
  * Facilitam a compreensão do uso da função por quem não conhece a função
  * Aumentam a verbosidade da chamada de função

*/
