import 'package:ttos/screen/notification/vo/notification_type.dart';

class TtosNotification {
  final NotificationType type;
  final String desc;
  final DateTime dt;
  bool isRead;

  TtosNotification(this.type, this.desc, this.dt, {this.isRead = false});
}
