import 'package:ttos/common/data/preference/item/nullable_preference_item.dart';
import 'package:ttos/common/data/preference/item/preference_item.dart';
import 'package:ttos/common/theme/custom_theme.dart';

class Prefs {
  static final appTheme = NullablePreferenceItem<CustomTheme>('appTheme');
  static final isPushOn = PreferenceItem<bool>('isPushOn', false);
}
