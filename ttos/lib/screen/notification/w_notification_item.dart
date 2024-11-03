import 'package:flutter/material.dart';
import 'package:ttos/common/common.dart';
import 'package:ttos/screen/notification/vo/vo_notification.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationItemWidget extends StatefulWidget {
  final TtosNotification notification;
  final VoidCallback onTap;

  const NotificationItemWidget({
    super.key,
    required this.notification,
    required this.onTap,
  });

  @override
  State<NotificationItemWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationItemWidget> {
  static const double leftPadding = 10;
  static const double iconWidth = 25;
  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: leftPadding),
        color: widget.notification.isRead
            ? context.backgroundColor
            : context.appColors.unreadColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                width10,
                Image.asset(
                  widget.notification.type.iconPath,
                  width: iconWidth,
                ),
                widget.notification.type.name.text
                    .color(context.appColors.lessImportantText)
                    .size(12)
                    .make(),
                Expanded(child: Container()),
                timeago
                    .format(
                      widget.notification.dt,
                      locale: context.locale.languageCode,
                    )
                    .text
                    .size(13)
                    .color(context.appColors.lessImportantText)
                    .make(),
                width10,
              ],
            ),
            widget.notification.desc.text
                .make()
                .pOnly(left: leftPadding + iconWidth),
          ],
        ),
      ),
    );
  }
}
