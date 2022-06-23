/*
1) Para atribuir um valor em um atributo, qual a diferença em: (i) atribuir
um valor no atributo na definição da classe; e (ii) solicitar o seu valor via
parâmetro do contrutor?

R: Atribuir um valor na definição da classe torna aquele valor um padrão
para o objeto, ou seja, toda instância da classe terá por padrão aquele valor
para aquele atributo mesmo sem atribuir valor na instância. Solicitar via 
construtor possibilita que um valor seja dado na instanciação da classe.
*/

/*
2) O que é para que ser construtor? Qual código pode-se definir nele?

R: Construtor é o que de fato constroi uma instância da classe. Na realidade 
qualquer código pode ser definido nele, porém, normalmente, defini-se apenas
códigos que toda instância da classe irá necessitar.
*/

/*
3) Para que serve "final"? Em que caso utilizamos? 
Para coletar dados, qual a vantagem e desvantagem?

R: "final" serve para "dizer" ao compilador que o valor da variável não poderá
ser alterado durante a execução do programa, porém, seu valor padrão é dado
em tempo de execução. Utilizamos "final" quando não queremos que o valor seja
alterado durante a execução do programa.
*/

/*
Crie e instancie as classes abaixo. Para cada atributo, atribua valores, altere os valores e imprima-os.
  * → obrigatório
  = valor (valor padrão)
  ? pode ser nulo
Caso não esteja implícito, de acordo com o contexto, defina se os atributos podem ser nulos ou não e se podem ser privado ou não. 
a) Bola{cor=branco,tamanho=7, categoria?}
*/

class Bola {
  String cor = "branco";
  int tamanho = 7;
  String? categoria;
}

// b) Professor{ id, nome, cpf, e-mail} >> inicialize todos os atributos no contrutor

class Professor {
  late int _id;
  String nome;
  String cpf;
  String email;

  get id => _id;

  Professor(int id, this.nome, this.cpf, this.email) {
    this._id = id;
  }
}

/*
c) Aluno{ ra, nome, cpf, telefone} >> com todos os atributos final, 
inicialize todos os atributos no contrutor utilizando parâmetros nomeados
*/

class Aluno {
  final String nome;
  final String cpf;
  final String telefone;
  final String ra;

  Aluno({
    required this.nome,
    required this.cpf,
    required this.telefone,
    required this.ra,
  });
}

/*
d) Peça{código, nome, descrição, preço de custo} 
  → get nome e descição, get preço de venda (30% sobre o preço de custo)
  → set código - somente números positivos 
  → set preço de custo - somente valore positivos
*/

class Peca {
  late int _codigo;
  late String nome;
  late String descricao;
  late double _precoCusto;

  int get codigo => _codigo;

  set codigo(int c) => c > 0 ? codigo = c : throw Exception("Código inválido");

  double get precoCusto => _precoCusto;

  set precoCusto(double preco) =>
      preco > .0 ? _precoCusto = preco : throw Exception("Código inválido");

  String get nomeEDescricao => "$nome - $descricao";

  double get precoVenda => precoCusto + (precoCusto * .3);
}

/*
e) Carro{nome, ano fabricação} 
  → get tempo de uso, get nome e ano fabricação
  → set ano fabricação - somente ano positivo e coerente
*/

class Carro {
  late String nome;
  late int _anoFabricacao;

  int get anoFabricacao => _anoFabricacao;

  set anoFabricacao(int ano) =>
      ano > 0 ? _anoFabricacao = ano : throw Exception("Ano inválido");

  String get nomeEAnoFabricacao => "$nome - $anoFabricacao";

  int get tempoUso => DateTime.now().year - anoFabricacao;
}

// f) Cidade{nome,Estado{nome,sigla}}

class Estado {
  String nome;
  String sigla;

  Estado({
    required this.nome,
    required this.sigla,
  });
}

class Cidade {
  String nome;
  Estado estado;

  Cidade({
    required this.nome,
    required this.estado,
  });
}

// g) Funcionario{nome, cpf, telefone, Cidade{nome,Estado{nome,sigla}}}

class Funcionario {
  String nome;
  String cpf;
  String telefone;
  Cidade cidade;

  Funcionario({
    required this.nome,
    required this.cpf,
    required this.telefone,
    required this.cidade,
  });
}

/*
h) Peca{nome,Tipo{nome,Categoria{nome, descirção}},
Unidade de Medida{sigla, descricao}, 
Fabricante{nome,Cidade{nome,Estado{nome,sigla}} }}
*/

class UnidadeMedida {
  String sigle;
  String descricao;

  UnidadeMedida({
    required this.sigle,
    required this.descricao,
  });
}

class Categoria {
  String nome;
  String descricao;

  Categoria({
    required this.nome,
    required this.descricao,
  });
}

class Tipo {
  String nome;
  Categoria categoria;

  Tipo({
    required this.nome,
    required this.categoria,
  });
}

class Peca2 {
  String nome;
  Tipo tipo;

  Peca2({
    required this.nome,
    required this.tipo,
  });
}

class Fabricante {
  String nome;
  Cidade cidade;

  Fabricante({
    required this.nome,
    required this.cidade,
  });
}

// i) Faça 4 classes do seu estudo de caso utilizando tudo que aprendeu hoje.

class Bullet {
  late double caliber;
  late double mass;

  Bullet({required double caliber}) {
    if (validateBulletCaliber(caliber)) {
      this.caliber = caliber;
    }
  }

  bool validateBulletCaliber(double caliber) {
    return caliber == 22 || caliber == 5.56 || caliber == 5.5 || caliber == 50;
  }

  void setMass(double caliber) {
    if (caliber == 22) {
      mass = .2;
    } else if (caliber == 5.56) {
      mass = .4;
    } else if (caliber == 5.55) {
      mass = .43;
    } else if (caliber == 50) {
      mass = .8;
    }
  }

  double calculateTrim(double distance, [double velocity = 4.5]) {
    if (distance < 0 || velocity < 0) {
      throw Exception("Distance and velocity must be greater than 0");
    }
    double gravity = 9.82;
    double weightForce = mass * gravity;
    double trim = weightForce - calculateSlowdown(distance, velocity);
    if (trim < 0) {
      return 0;
    }
    return trim;
  }

  double calculateSlowdown(double distance, double velocity) {
    return velocity / distance;
  }
}

class BulletProofVest {
  late double protectFactor;
  late double degradation = .35;

  BulletProofVest({required double proctectFactor}) {
    protectFactor = proctectFactor;
  }

  double totalResistence() {
    return protectFactor - (degradation * .8);
  }

  void applyDegradation(double bulletCaliber) {
    if (bulletCaliber == 22) {
      degradation += .1;
    } else if (bulletCaliber == 5.56) {
      degradation += .23;
    } else if (bulletCaliber == 5.55) {
      degradation += .21;
    } else if (bulletCaliber == 50) {
      degradation += .4;
    }
    if (degradation > 1) {
      degradation = 1;
    }
  }
}

class Gun {
  late Bullet bullet;
  late String category;
  late int bulletRate;
  late int maxAmmo;
  late int ammunationQuantity;

  Gun({
    required this.bullet,
    required this.category,
    required this.bulletRate,
    required this.maxAmmo,
  }) {
    ammunationQuantity = maxAmmo;
  }

  Bullet fire() {
    if (ammunationQuantity == 0) {
      reload();
      throw Exception("No ammo");
    }
    ammunationQuantity--;
    return bullet;
  }

  int getReloadAnimationFrames() {
    if (bullet.caliber == 22) {
      return 25;
    } else if (bullet.caliber == 5.56) {
      return 45;
    } else if (bullet.caliber == 5.55) {
      return 41;
    } else if (bullet.caliber == 50) {
      return 90;
    } else {
      throw Exception("Invalid bullet caliber");
    }
  }

  void reload() {
    if (ammunationQuantity == maxAmmo) {
      throw Exception('Ammunation full');
    }
    int animationFrame = 0;
    while (animationFrame < getReloadAnimationFrames()) {
      animationFrame++;
    }
    ammunationQuantity = maxAmmo;
  }
}

class Personagem {
  double vida = 1000;
  double armadura = 32;
  double resistenciaMagica = 12;
  double multiplicadorMaldicao = 0;
}
