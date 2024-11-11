import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttos/common/common.dart';
import 'package:ttos/common/dart/extension/datetime_extension.dart';
import 'package:ttos/common/data/preference/prefs.dart';
import 'package:ttos/common/widget/w_big_button.dart';
import 'package:ttos/screen/main/tab/stock/setting/w_switch_menu.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: '설정'.text.make()),
      body: ListView(
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
              onChanged: (val) => Prefs.sliderPosiion(val),
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
          // number dialog
        ],
      ),
    );
  }
}
