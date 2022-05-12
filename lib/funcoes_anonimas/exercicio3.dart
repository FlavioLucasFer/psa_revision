import 'dart:io';

/*
Exercício 01 - implemente as funções
a) Função que solicite um número e realizar validações: (1) se é par; (2) maior que zero; (3) se é um número primo.
função "hospedeira" : solicitar um número
b) Função que solicite a data inicial e retorne quanto tempo passou em: (1) anos; (2) dias; e (3) horas.
c) Função que solicite a quantidade de dias trabalhadas, valor que recebe por hora e calcule o salarário para: (1) auxiliar; (2) júnior; e (3) pleno.
Exercício 02 - para cada função "hospedeira", defina uma função anônima.
*/

void main() {
  // testes exercício 01
  try {
    print(validateNumber(isEven));
  } catch (e) {
    print('err:');
    print(e);
  }
  try {
    print(validateNumber(isGreaterThenZero));
  } catch (e) {
    print('err:');
    print(e);
  }
  try {
    print(timespent(yearsSpent));
  } catch (e) {
    print('err:');
    print(e);
  }
  try {
    print(timespent(hoursSpent));
  } catch (e) {
    print('err:');
    print(e);
  }
  // print(timespent(daysSpent));
  try {
    print(calculateSalary(calculateAssistantSalary));
  } catch (e) {
    print('err:');
    print(e);
  }
  // print(calculateSalary(calculateJuniorSalary));
  // print(calculateSalary(calculatePlenoSalary));

  // ex 02
  print(validateNumber((number) => number % 2 != 0)); // valida se é ímpar
  print(timespent((date) {
    return DateTime.now()
        .difference(date)
        .inMinutes; // calcula minutos passados
  }));
  print(
      calculateSalary((days) => days * (60 * 8))); // calcula salário de Sênior
}

// 1 - a
bool validateNumber(bool Function(double number) validation) {
  print('Digite um número:');
  var input = stdin.readLineSync();
  if (input == null) {
    throw Exception('Input is empty');
  }
  if (double.tryParse(input) == null) {
    throw Exception('Cannot parse input to double');
  }
  return validation(double.parse(input));
}

bool isEven(double number) {
  return number % 2 == 0;
}

bool isGreaterThenZero(double number) {
  return number > 0;
}

bool isPrimeNumber(double number) {
  if (number == 2)
    return true;
  else if (number > 1)
    for (var i = 2; i < number; i++) {
      if (number % i != 0)
        return true;
      else if (number == i * i) return false;
      return false;
    }
  return false;
}

// 1 - b
int timespent(int Function(DateTime date) validation) {
  print('Informe a data inicial:');
  var input = stdin.readLineSync();
  if (input == null || DateTime.tryParse(input) == null) {
    throw Exception('Data inválida!');
  }
  return validation(DateTime.parse(input));
}

int yearsSpent(DateTime date) {
  return (DateTime.now().difference(date).inDays / 365).floor();
}

int daysSpent(DateTime date) {
  return DateTime.now().difference(date).inDays;
}

int hoursSpent(DateTime date) {
  return DateTime.now().difference(date).inHours;
}

// 1 - c
double calculateSalary(double Function(int days) validation) {
  print('Informe a quantidade de dias trabalhados:');
  var input = stdin.readLineSync();
  if (input == null || int.tryParse(input) == null) {
    throw Exception('Quantidade de dias inválida!');
  }
  return validation(int.parse(input));
}

double calculateAssistantSalary(int days) {
  return days * (15 * 8);
}

double calculateJuniorSalary(int days) {
  return days * (35 * 8);
}

double calculatePlenoSalary(int days) {
  return days * (48 * 8);
}
