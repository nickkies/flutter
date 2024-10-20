import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main() {
  rps();
  print('----------------------------');
  asyncProgram();
  exception();
  forLoop();
  switchControl('월');
  print(ifControl(10 > 20));
  print(add(1, 2));
}

/// async / await / Future
/// async* / yield / Stream
void asyncProgram() {
  future(1);
  future(5);
  future(3);

  stream().listen((data) {
    print('외부 $data');
  });
}

Stream<int> stream() async* {
  int cnt = 0;

  while (cnt < 5) {
    await Future.delayed(Duration(seconds: 1));
    print('내부 $cnt');
    yield cnt++;
  }

  print('steam 끝');
}

Future<void> future(int sec) async {
  await Future.delayed(Duration(seconds: sec));
  print('done in $sec');
}

void exception() {
  try {
    // int num = 10 ~/ 0;
    throw Exception('error!!!');
  } on UnsupportedError catch (e, s) {
    print('0으로 나누지 마세요.');
    print(s);
  } catch (e) {
    // rethrow;
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

void rps() {
  print('가위 바위 보~');
  final String input = stdin.readLineSync(encoding: utf8) ?? 'Error';

  const list = ['가위', '바위', '보'];
  final cmp = list[Random().nextInt(list.length)];

  switch (input) {
    case '가위':
      getRes('보', '바위', cmp);
    case '바위':
      getRes('가위', '보', cmp);
    case '보':
      getRes('바위', '가위', cmp);
    default:
      print('`가위`, `바위`, `보` 중에서 입력하세요.');
      rps();
  }
}

void getRes(String win, String lose, String cmp) {
  print('컴퓨터는 $cmp를 냈습니다.');

  if (cmp == win) {
    print('승리~');
  } else if (cmp == lose) {
    print('패배~');
  } else {
    print('비김. 다시 가위 바위 보');
    rps();
  }
}
