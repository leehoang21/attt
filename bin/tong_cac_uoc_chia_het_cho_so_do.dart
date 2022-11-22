class TongCacUocCHiaHetCHoSoDo {
  static void tongCacUocCHiaHetCHoSoDo(int a) {
    int s = a;
    for (int i = 1; i <= a / 2; i++) {
      if (a % i == 0) {
        s -= i;
      }
    }
    if (s == 0) {
      print('$a chia het');
      return;
    }
  }
}
