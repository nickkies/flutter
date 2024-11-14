import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttos/common/common.dart';
import 'package:ttos/common/dart/extension/datetime_extension.dart';
import 'package:ttos/common/data/preference/prefs.dart';
import 'package:ttos/common/widget/w_big_button.dart';
import 'package:ttos/screen/main/tab/stock/setting/d_number.dart';
import 'package:ttos/screen/main/tab/stock/setting/w_aimated_app_bar.dart';
import 'package:ttos/screen/main/tab/stock/setting/w_switch_menu.dart';
import 'package:ttos/screen/opensource/s_opensource.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen>
    with SingleTickerProviderStateMixin {
  final scrollController = ScrollController();
  late final AnimationController animationController =
      AnimationController(vsync: this, duration: 2000.ms);

  @override
  void initState() {
    super.initState();
    animationController.addListener(() {
      final AnimationStatus status = animationController.status;

      switch (status) {
        case AnimationStatus.forward:
        // 여기서
        case AnimationStatus.reverse:
        // 뭔가를
        case AnimationStatus.completed:
        // 할 수도
        case AnimationStatus.dismissed:
        // 있음
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            controller: scrollController,
            padding: const EdgeInsets.only(top: 150),
            children: [
              Obx(
                () => SwitchMenuWidget(
                  '푸시 설정',
                  Prefs.isPushOnRx.get(),
                  onTap: (isOn) => Prefs.isPushOnRx.set(isOn),
                ),
              ),
              Obx(
                () => Slider(
                  value: Prefs.sliderPosiion.get(),
                  onChanged: (val) {
                    animationController.animateTo(val, duration: 0.ms);
                    Prefs.sliderPosiion(val);
                  },
                ),
              ),
              Obx(
                () => BigButton(
                  '날짜 ${Prefs.birthday.get() == null ? '' : Prefs.birthday.get()?.formattedDate}',
                  onTap: () async {
                    final DateTime? date = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now().subtract(90.days),
                      lastDate: DateTime.now().add(90.days),
                    );

                    if (date == null) return;

                    Prefs.birthday(date);
                  },
                ),
              ),
              Obx(
                () => BigButton(
                  '저장된 숫자 ${Prefs.number.get()}',
                  onTap: () async {
                    final int? number = await NumberDialog().show();

                    if (number == null) return;

                    Prefs.number(number);
                  },
                ),
              ),
              BigButton(
                '오픈소스 화면',
                onTap: () async => Nav.push(const OpensourceScreen()),
              ),
              BigButton('Forword animation', onTap: () async {
                animationController.forward();
              }),
              BigButton('Reverse animation', onTap: () async {
                animationController.reverse();
              }),
              BigButton('Repeat animation', onTap: () async {
                animationController.repeat();
              }),
              BigButton('Reset animation', onTap: () async {
                animationController.reset();
              }),
              BigButton('스크롤', onTap: () {}),
              BigButton('스크롤', onTap: () {}),
              BigButton('스크롤', onTap: () {}),
              BigButton('스크롤', onTap: () {}),
              BigButton('스크롤', onTap: () {}),
              BigButton('스크롤', onTap: () {}),
              BigButton('스크롤', onTap: () {}),
              BigButton('스크롤', onTap: () {}),
              BigButton('스크롤', onTap: () {}),
              BigButton('스크롤', onTap: () {}),
              BigButton('스크롤', onTap: () {}),
              BigButton('스크롤', onTap: () {}),
              BigButton('스크롤', onTap: () {}),
              // number dialog
            ],
          ),
          AnimatedAppBar(
            '설정',
            scrollController: scrollController,
            animationController: animationController,
          ),
        ],
      ),
    );
  }
}
