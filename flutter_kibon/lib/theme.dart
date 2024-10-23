import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTheme extends StatelessWidget {
  const MyTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globalTheme,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text('Theme')),
          body: const Column(
            children: [
              MyCheckbox(),
              MyRadioButton(),
              MySlider(),
              MySwitch(),
              MyPopupMenu(),
            ],
          ),
        ),
      ),
    );
  }
}

final globalTheme = ThemeData(
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 32,
    ),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
  // colorScheme: const ColorScheme.dark(
  //   primary: Colors.lime,
  //   secondary: Colors.indigo,
  //   tertiary: Colors.cyan,
  // ),
  // appBarTheme: const AppBarTheme(
  //   backgroundColor: Colors.blueGrey,
  // ),
);

class MyCheckbox extends StatefulWidget {
  const MyCheckbox({super.key});

  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  late List<bool> values;

  @override
  void initState() {
    super.initState();
    values = [false, false, false];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: values[0],
          onChanged: (val) => handleCheckbox(0, isChecked: val),
        ),
        Checkbox(
          value: values[1],
          onChanged: (val) => handleCheckbox(1, isChecked: val),
        ),
        Checkbox(
          value: values[2],
          onChanged: (val) => handleCheckbox(2, isChecked: val),
        ),
      ],
    );
  }

  void handleCheckbox(int idx, {bool? isChecked = false}) {
    setState(() {
      values[idx] = isChecked!;
    });
  }
}

enum MyEnumValue {
  test1,
  test2,
  test3,
}

class MyRadioButton extends StatefulWidget {
  const MyRadioButton({super.key});

  @override
  State<MyRadioButton> createState() => _MyRadioButtonState();
}

class _MyRadioButtonState extends State<MyRadioButton> {
  MyEnumValue? myRadioValue;

  @override
  void initState() {
    super.initState();
    myRadioValue = null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Radio<MyEnumValue>(
            value: MyEnumValue.test1,
            groupValue: myRadioValue,
            onChanged: (val) => setState(() => myRadioValue = val),
          ),
          title: Text(MyEnumValue.test1.name),
          onTap: () {
            if (myRadioValue != MyEnumValue.test1) {
              setState(() => myRadioValue = MyEnumValue.test1);
            }
          },
        ),
        ListTile(
            leading: Radio<MyEnumValue>(
              value: MyEnumValue.test2,
              groupValue: myRadioValue,
              onChanged: (val) => setState(() => myRadioValue = val),
            ),
            title: Text(MyEnumValue.test2.name),
            onTap: () {
              if (myRadioValue != MyEnumValue.test2) {
                setState(() => myRadioValue = MyEnumValue.test2);
              }
            }),
        ListTile(
            leading: Radio<MyEnumValue>(
              value: MyEnumValue.test3,
              groupValue: myRadioValue,
              onChanged: (val) => setState(() => myRadioValue = val),
            ),
            title: Text(MyEnumValue.test3.name),
            onTap: () {
              if (myRadioValue != MyEnumValue.test3) {
                setState(() => myRadioValue = MyEnumValue.test3);
              }
            }),
      ],
    );
  }
}

class MySlider extends StatefulWidget {
  const MySlider({super.key});

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  double sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('${sliderValue.round()}'),
      Slider(
        value: sliderValue,
        onChanged: (val) => setState(() => sliderValue = val),
        divisions: 10,
        max: 100,
        min: 0,
        label: sliderValue.round().toString(),
      ),
    ]);
  }
}

class MySwitch extends StatefulWidget {
  const MySwitch({super.key});

  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Switch(
          value: switchValue,
          onChanged: (val) => setState(() => switchValue = val),
        ),
        CupertinoSwitch(
          value: switchValue,
          onChanged: (val) => setState(() => switchValue = val),
        )
      ],
    );
  }
}

class MyPopupMenu extends StatefulWidget {
  const MyPopupMenu({super.key});

  @override
  State<MyPopupMenu> createState() => _MyPopupMenuState();
}

class _MyPopupMenuState extends State<MyPopupMenu> {
  MyEnumValue menuValue = MyEnumValue.test1;

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    final textTheme = globalTheme.textTheme;

    return Row(
      children: [
        PopupMenuButton(
          itemBuilder: (context) {
            return MyEnumValue.values
                .map(
                  (e) => PopupMenuItem(
                    value: e,
                    // child: Text(e.name, style: textTheme.bodyMedium),
                    child: Text(e.name, style: textTheme.displaySmall),
                  ),
                )
                .toList();
          },
          onSelected: (val) => setState(() => menuValue = val),
        ),
        Text(menuValue.name),
      ],
    );
  }
}
