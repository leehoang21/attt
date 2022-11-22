class Pow {
  static double pow(double a, int b) {
    double s = 1;
    for (int i = 1; i <= b; i++) {
      s *= a;
    }
    return s;
  }

  static int pow5(int a) {
    int s = 5 * 5;
    int phanNguyen = a ~/ 10;
    for (var i = 1; i <= phanNguyen; i++) {
      s += (i * 200);
    }
    return s;
  }

  // static int montgomeryExponentiation(int a,int n) {
  //   if(a%2==1){
  //     return -1;
  //   }else{

  //   }
  // }

}
