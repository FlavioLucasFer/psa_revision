import 'package:psa_revision/avaliacao1-04-06/avaliacao1.dart';
import 'package:test/test.dart';

void main() {
  group('Testing avaliacao1-04-06/avaliacao1.dart', () {
    group('bullet damage functions', () {
      group('validateBulletCaliber', () {
        test('should be valid', () {
          expect(validateBulletCaliber(50), true);
          expect(validateBulletCaliber(22), true);
          expect(validateBulletCaliber(5.5), true);
          expect(validateBulletCaliber(5.56), true);
        });
        test('should be invalid', () {
          expect(validateBulletCaliber(7), false);
        });
      });

      group('chestFire', () {
        test('should be equal to 0.288', () {
          var vest = BulletProofVest(proctectFactor: .8);
          expect(chestFire(vest, 50), .288);
        });
      });
    });
  });
}
