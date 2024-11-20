import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:ttos/common/common.dart';
import 'package:ttos/common/widget/w_round_button.dart';
import 'package:ttos/common/widget/w_rounded_container.dart';
import 'package:ttos/screen/main/tab/stock/setting/w_text_watching_bear.dart';

class NumberDialog extends DialogWidget<int> {
  NumberDialog({
    super.key,
    super.animation = NavAni.Fade,
    super.barrierDismissible = false,
  });

  @override
  State<NumberDialog> createState() => _NumberDialogState();
}

class _NumberDialogState extends DialogState<NumberDialog> {
  final numberController = TextEditingController();
  final passwordController = TextEditingController();
  final numberFocus = FocusNode();
  final passwordFocus = FocusNode();
  final textBearController = TextWatchingBearController();

  bool check = false;
  bool handsUp = false;
  double look = 0.0;

  @override
  void initState() {
    super.initState();

    numberController.addListener(() {
      setState(() => look = numberController.text.length.toDouble() * 5);
    });
    numberFocus.addListener(() {
      setState(() => check = numberFocus.hasFocus);
    });
    passwordFocus.addListener(() {
      setState(() => handsUp = passwordFocus.hasFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: RoundedContainer(
        child: Column(
          children: [
            '숫자를 입력해주세요.'.text.make(),
            SizedBox(
              width: 230,
              height: 230,
              child: TextWatchingBearWidget(
                check: check,
                handsUp: handsUp,
                look: look,
                controller: textBearController,
              ),
            ),
            TextField(
              focusNode: numberFocus,
              controller: numberController,
              keyboardType: TextInputType.number,
              maxLength: 20,
            ),
            TextField(
              focusNode: passwordFocus,
              obscureText: true,
              controller: passwordController,
              keyboardType: TextInputType.number,
            ),
            RoundButton(
              text: '완료',
              onTap: () async {
                final String text = numberController.text;

                try {
                  int num = int.parse(text);
                  textBearController.runSuccessAnimation();

                  await sleepAsync(1.seconds);

                  widget.hide(num);
                } catch (ex) {
                  debugPrint(ex.toString());
                  textBearController.runFailAnimation();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
