import 'package:events/theme/theme_controller.dart';
import 'package:events/views/notification.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationItem extends StatelessWidget {
  final NotificationView notificationView;

  const NotificationItem({Key key, this.notificationView}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(
          notificationView.icon,
          color: Colors.white,
          size: 20.0,
        ),
        backgroundColor: notificationView.isRead ? Colors.grey : null,
      ),
      title: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.subhead,
          children: <TextSpan>[
            _buildEmphasizedText(context, notificationView.messageStart),
            TextSpan(
              text: notificationView.messageMiddle,
              style: TextStyle(
                color: notificationView.isRead ? Colors.grey : null,
              ),
            ),
            _buildEmphasizedText(context, notificationView.messageEnd),
          ],
        ),
      ),
      subtitle: Text(notificationView.dateString),
    );
  }

  TextSpan _buildEmphasizedText(BuildContext context, String text) {
    return TextSpan(
      text: text,
      style: TextStyle(
        fontWeight: FontWeight.w800,
        color: notificationView.isRead
            ? Theme.of(context).disabledColor
            : Provider.of<ThemeController>(context).theme.iconColor,
      ),
    );
  }
}
