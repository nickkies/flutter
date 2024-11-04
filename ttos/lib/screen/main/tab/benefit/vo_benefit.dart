import 'package:ttos/common/constants.dart';

class Benefit {
  final String imagePath;
  final String title;
  final String subTitle;

  Benefit(String imgNm, this.title, this.subTitle)
      : imagePath = '$basePath/benefit/$imgNm.png';
}
