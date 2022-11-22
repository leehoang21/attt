import 'dart:math' as math;

class MultiprecisionAdditionOurPut {
  final int e;
  final double result;

  MultiprecisionAdditionOurPut(this.e, this.result);
}

class CacPhepTinhDungTrenSoDangMang {
  static List<int> bieuDienSoDangMang(double soBit, double so, double heSo) {
    var m = math.log(heSo) / math.log(2);
    List<int> soDangMang = [];
    //length của @soDangMang
    var lengthSo = m ~/ soBit;
    for (var i = lengthSo; i >= 0; i--) {
      double x = math.pow(2, soBit * i) as double;
      var y = so ~/ x;
      soDangMang.add(y);
      so -= y * x;
    }
    return soDangMang;
  }
  // MultiprecisionAdditionOurPut multiprecisionAddition(
  //     List<int> a, List<int> b, int soBit, int b) {}
}
