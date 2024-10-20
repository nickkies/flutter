void main() {
  exception();
  forLoop();
  switchControl('월');
  print(ifControl(10 > 20));
  print(add(1, 2));
}

void exception() {
  try {
    // int num = 10 ~/ 0;
    throw Exception('error!!!');
  } on UnsupportedError catch (e, s) {
    print('0으로 나누지 마세요.');
    print(s);
  } catch (e) {
    rethrow;
  } finally {
    print('try문 끝남');
  }
}

/// while, do-while 똑같음
void forLoop() {
  for (int i = 1; i < 3; i++) {
    print('뽀문 $i');
  }

  List<int> items = [1, 2];
  for (final item in items) {
    print('뽀문 $item');
  }
}

/// Flutter 3.10 | dart 3.0 이전에는
/// break | return 넣어야함
void switchControl(String str) {
  switch (str) {
    case '월':
    case '화':
      print('월화');
    case '수':
      print('수');
    default:
      print('목금토일');
  }

  int num = 10;

  switch (num) {
    case > 100:
      print("100 넘음");
    default:
      print("100 안넘음");
  }
}

/// else if 똑같음
String ifControl(bool bool) {
  String res;

  if (bool) {
    res = 'True';
  } else {
    res = 'False';
  }

  return res;
}

int add(int num1, int num2) {
  return num1 + num2;
}
