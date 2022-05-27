void main() {}

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

  vest.applyDegradation(bulletCaliber);

  return double.parse(damage.toStringAsFixed(3));
}

double headshort(double bulletCaliber) {
  double headResistence = .001;
  double damage;
  try {
    damage = (bulletCaliberDamage(bulletCaliber) * 2.5) - headResistence;
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
