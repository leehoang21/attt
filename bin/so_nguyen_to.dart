import 'gcd.dart';

class SoNguyento {
  bool isSNT(int s) {
    if (s < 4) {
      return s > 1;
    } else {
      if (s % 2 == 0 || s % 3 == 0) {
        return false;
      } else {
        for (int i = 5; i * i <= s; i += 6) {
          if (s % i == 0 || s % (i + 2) == 0) {
            return false;
          }
        }
        return true;
      }
    }
  }

  // bool isSNTFebma(int s) {

  // }

  bool isSNTMiller(int so, int param) {
    if (so < 3 && param < 1) {
      return false;
    }
    int s = _timS(so - 1);
    int a = 3;
    for (var i = 1; i <= param; i++) {
      int y = nhanBinhPhuongCoLap(a, s, so);
      if (y != 1 && y != so - 1) {
        int j = 1;
        while (j < s - 1 && y != so - 1) {
          y = ((y * y) % so);
          if (y == 1) {
            return false;
          }
          j++;
        }
        if (y != so - 1) {
          return false;
        }
      }
    }
    return true;
  }

  int _timS(int s) {
    int r = 0;
    while (s % 2 == 0) {
      s ~/= 2;
      r++;
    }
    return r;
  }

  int nhanBinhPhuongCoLap(int a, int b, int n) {
    int kq = 1;
    while (b > 0) {
      if (b % 2 == 1) {
        kq = (kq * a) % n;
      }
      a = (a * a) % n;
      b = b ~/ 2;
    }
    return kq;
  }

  static List<int> eratosthenesNguyenThuy(int n) {
    List<int> snt = [];
    List<bool> isPrime = List.filled(n + 2, true);
    int p = 2;
    while (p <= n) {
      for (var i = 2; i * p <= n; i++) {
        isPrime[i * p] = false;
      }
      //
      for (var i = p + 1; i < isPrime.length; i++) {
        if (isPrime[i]) {
          p = i;
          break;
        }
      }
    }
    for (int i = 2; i < isPrime.length - 1; i++) {
      if (isPrime[i]) {
        snt.add(i);
      }
    }
    return snt;
  }

  void phanTichSoNguyenTo(int n) {
    List<int> result = phanTichSoNguyenToRaList(n);
    //
    if (soNTLaHoanHao(result)) {
      print("$n là Lũy thừa hoàn hảo");
    }
    printSoNT(result);
  }

  void phanTichSoNguyenTo2(int n) {
    List<int> result = phanTichSoNguyenToRaList2(n);
    //
    if (soNTLaHoanHao(result)) {
      print("$n là Lũy thừa hoàn hảo");
    }
    printSoNT(result);
  }

  void thuaSoKhongTamThuongSoNguyenTo(int n) {
    int a = 2;
    int b = 2;
    int d = 0;
    int i = 1;
    if (isSNT(n)) {
      print("$n là số nguyên tố");
      return;
    }
    do {
      a = (a * a + i) % n;
      b = (b * b + i) % n;
      b = (b * b + i) % n;
      d = GCD.gcd(b - a, n);
      if (d >= n) {
        i++;
        a = 2;
        b = 2;
      } else if (d > 1) {
        print('$d * ${n ~/ d}');
        return;
      }
    } while (true);
  }

  bool soNTLaHoanHao(List<int> soNT) {
    soNT.sort();
    return soNT.first == soNT.last;
  }

  void printSoNT(List<int> result) {
    String str = '';
    result.sort();
    while (result.isNotEmpty) {
      int x = result.first;
      result.remove(x);
      int count = 1;
      while (result.isNotEmpty && result.first == x) {
        result.removeAt(0);
        count++;
      }
      if (count != 1) {
        str += '$x^$count * ';
      } else {
        str += '$x * ';
      }
    }
    print(str.substring(0, str.length - 3));
  }

  List<int> phanTichSoNguyenToRaList(int n) {
    List<int> listThuaSo = [n];
    List<int> result = [];
    while (listThuaSo.isNotEmpty) {
      int x = listThuaSo.removeLast();
      if (isSNT(x)) {
        result.add(x);
      } else {
        for (int i = 2; i <= x / 2; i++) {
          if (x % i == 0) {
            listThuaSo.add(i);
            if (x / i < 2) {
              break;
            }
            listThuaSo.add(x ~/ i);
            break;
          }
        }
      }
    }
    result.sort();
    return result;
  }

  List<int> phanTichSoNguyenToRaList2(int n) {
    List<int> result = [];
    int i = 2;
    while (n > 1) {
      if (isSNT(i)) {
        i++;
        continue;
      }
      if (n % i == 0) {
        result.add(i);
        n = n ~/ i;
      } else {
        i++;
      }
    }
    return result;
  }
}

void main(List<String> args) {
  //print(SoNguyento.eratosthenesNguyenThuy(1000));
  // SoNguyento().phanTichSoNguyenTo(25);
  // SoNguyento().phanTichSoNguyenTo2(25);
  //SoNguyento().thuaSoKhongTamThuongSoNguyenTo(45545);
  print(SoNguyento().nhanBinhPhuongCoLap(2, 382, 383));
  print(SoNguyento().isSNTMiller(113, 2));
}
