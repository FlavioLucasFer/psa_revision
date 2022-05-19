void main() {}

class BulletProofVest {
  late double protectFactor;
  late double degradation = .35;

  BulletProofVest({required double proctectFactor}) {
    protectFactor = proctectFactor;
  }

  double totalResistence() {
    return protectFactor - (degradation * .8);
  }
}

double calculateBulletDamage(
    BulletProofVest vest, double bulletCaliber, Function bodyRegionDmgCalc) {
  if (vest.protectFactor <= 1 || vest.protectFactor >= 0) {
    throw Exception(
        'Invalid Bullet-Proof Vest: protect factor must be within 0-1 range');
  } else if (vest.degradation <= 1 || vest.degradation >= 0) {
    throw Exception(
        'Invalid Bullet-Proof Vest: degradation must be within 0-1 range');
  } else if (!validateBulletCaliber(bulletCaliber)) {
    throw Exception('Invalid Bullet Caliber: invalid bullet caliber');
  }
  return bodyRegionDmgCalc(vest, bulletCaliber);
}

bool validateBulletCaliber(double caliber) {
  return caliber == 22 || caliber == 5.56 || caliber == 5.5 || caliber == 50;
}

double chestFire(BulletProofVest vest, double bulletCaliber) {
  double bodyResistence = .012;
  double totalReistence = vest.totalResistence() + bodyResistence;
  double damage;
  try {
    damage = bulletCaliberDamage(bulletCaliber) - totalReistence;
  } catch (e) {
    rethrow;
  }
  return double.parse(damage.toStringAsFixed(3));
}

double bulletCaliberDamage(double caliber) {
  if (caliber == 22) {
    return .221;
  } else if (caliber == 5.56) {
    return .454;
  } else if (caliber == 5.55) {
    return .434;
  } else if (caliber == 50) {
    return .82;
  } else {
    throw Exception('Invalid bullet caliber');
  }
}
