import 'package:flutter/material.dart';
import 'package:ttos/screen/notification/notification_dummy.dart';
import 'package:ttos/screen/notification/w_notification_item.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(title: Text('알림')),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: notificationDummies.length,
              (context, idx) => NotificationItemWidget(
                  notification: notificationDummies[idx]),
            ),
          ),
        ],
      ),
    );
  }
}
