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

      group('headshot', () {
        test('should be equal to', () {
          expect(headshort(5.56), 1.134);
        });
      });
    });

    group('Gun class functions', () {
      Gun gun = Gun(
          bullet: Bullet(caliber: 50),
          category: 'sniper',
          bulletRate: 1,
          maxAmmo: 10);
      group('getReloadAnimationFrames', () {
        Gun copy = gun;
        test('should be 25', () {
          copy.bullet.caliber = 22;
          expect(copy.getReloadAnimationFrames(), 25);
        });
        test('should be 45', () {
          copy.bullet.caliber = 5.56;
          expect(copy.getReloadAnimationFrames(), 45);
        });
        test('should be 41', () {
          copy.bullet.caliber = 5.55;
          expect(copy.getReloadAnimationFrames(), 41);
        });
        test('should be 90', () {
          copy.bullet.caliber = 50;
          expect(copy.getReloadAnimationFrames(), 90);
        });
        test('should throw exception', () {
          copy.bullet.caliber = 51;
          expect(() => copy.getReloadAnimationFrames(), throwsException);
        });
      });
      group('reload', () {
        test('should not reload', () {
          expect(() => gun.reload(), throwsException);
        });
        test('should reload', () {
          gun.ammunationQuantity -= 5;
          gun.reload();
          expect(gun.ammunationQuantity, 10);
        });
      });

      group('fire', () {
        test('should fire and reduce ammunationQuantity by 1 when fire', () {
          expect(gun.fire(), gun.bullet);
          expect(gun.ammunationQuantity, gun.maxAmmo - 1);
        });
        test('should not fire and reload when not fire', () {
          gun.ammunationQuantity = 0;
          expect(() => gun.fire(), throwsException);
          expect(gun.ammunationQuantity, gun.maxAmmo);
        });
      });
    });
  });
}
