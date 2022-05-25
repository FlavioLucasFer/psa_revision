import 'package:psa_revision/testes_unitarios/aprovacao_nota.dart';
import 'package:test/test.dart';

main() {
  group('Testing aprovacao_nota_test.dart', () {
    group('Testing calcularMedia function', () {
      test('Should be equal to 7', () {
        expect(calcularMedia(nota1: 6, nota2: 8), 7);
      });
      test('Should be equal to 0', () {
        expect(calcularMedia(nota1: 0, nota2: 0), 0);
      });
      test('Should not be equal to 8', () {
        expect(calcularMedia(nota1: 8, nota2: 9), isNot(8));
      });
      test('Should throws excepcion', () {
        expect(() => calcularMedia(nota1: -8, nota2: 9), throwsException);
      });
    });
  });
}
