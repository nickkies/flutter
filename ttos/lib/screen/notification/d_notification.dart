import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:ttos/common/common.dart';
import 'package:ttos/screen/notification/vo/vo_notification.dart';
import 'package:ttos/screen/notification/w_notification_item.dart';

class NotificationDialog extends DialogWidget {
  final TtosNotification notification;

  NotificationDialog(
    this.notification, {
    super.key,
    super.animation = NavAni.Bottom,
    super.barrierDismissible = false,
  });

  @override
  State<NotificationDialog> createState() => _NotificationDialogState();
}

class _NotificationDialogState extends DialogState<NotificationDialog> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: NotificationItemWidget(
        notification: widget.notification,
        onTap: () => widget.hide(),
      ),
    );
  }
}
