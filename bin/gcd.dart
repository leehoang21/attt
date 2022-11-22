class GCD {
  static int gcd(int number1, int number2) {
    int mod;
    while (number2 > 0) {
      mod = number1 % number2;
      number1 = number2;
      number2 = mod;
    }
    return number1;
  }

  static int binaryGCD(int a, int b) {
    int u = a;
    int v = b;
    int shift = 1;
    while (u % 2 == 0 && v % 2 == 0) {
      u = u ~/ 2;
      v = v ~/ 2;
      shift = shift * 2;
    }
    while (u != 0) {
      while (u % 2 == 0) {
        u = u ~/ 2;
      }
      while (v % 2 == 0) {
        v = v ~/ 2;
      }
      if (u >= v) {
        u = u - v;
      } else {
        v = v - u;
      }
    }
    return v * shift;
  }

  static int gcdDeQUy(int number1, int number2) {
    if (number1 % number2 == 0) {
      return number2;
    } else {
      return gcdDeQUy(number2, number1 % number2);
    }
  }

  //ax+by=d
  //d = gcd(a,b)
  //x = a mod b
  //y = b mod a
  static ResultEclide euclideMoRong(int a, int b) {
    int d, x, y, phanNuyen, phanDu;
    if (a < b) {
      int tmp = a;
      a = b;
      b = tmp;
    }
    //
    if (b == 0) {
      d = a;
      x = 1;
      y = 0;
    } else {
      int x2 = 1, x1 = 0, y2 = 0, y1 = 1;
      while (b > 0) {
        phanNuyen = a ~/ b;
        phanDu = a - phanNuyen * b;
        x = x2 - phanNuyen * x1;
        y = y2 - phanNuyen * y1;

        a = b;
        b = phanDu;
        x2 = x1;
        x1 = x;
        y2 = y1;
        y1 = y;
      }
      d = a;
      x = x2;
      y = y2;
    }
    return ResultEclide(d, x, y);
  }
}

class ResultEclide {
  final int d;
  final int x;
  final int y;

  ResultEclide(this.d, this.x, this.y);
}
