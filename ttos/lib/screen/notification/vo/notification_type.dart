import 'package:ttos/common/constants.dart';

enum NotificationType {
  ttosPay('또스페이', 'notification_toss'),
  luck('행운복권', 'notification_luck'),
  people('토스 공동구매', 'notification_people'),
  stock('토스증권 컨텐츠', 'notification_stock'),
  walk('만보기', 'notification_walk'),
  moneyTip('오늘의 머니 팁', 'notification_idea');

  const NotificationType(this.name, iconPath)
      : iconPath = '$basePath/notification/$iconPath.png';

  final String iconPath;
  final String name;
}
