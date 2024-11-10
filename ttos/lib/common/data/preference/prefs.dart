import 'package:ttos/common/data/preference/item/nullable_preference_item.dart';
import 'package:ttos/common/data/preference/item/rx_preference_item.dart';
import 'package:ttos/common/theme/custom_theme.dart';

class Prefs {
  static final appTheme = NullablePreferenceItem<CustomTheme>('appTheme');
  static final isPushOnRx = RxPreferenceItem<bool, RxBool>('isPushOn', false);
}
