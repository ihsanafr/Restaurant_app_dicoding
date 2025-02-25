import 'package:flutter/material.dart';
import 'notification_setting_widget.dart';
import 'package:restaurant_app/screen/setting/theme_setting_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          shadowColor: Theme.of(context).appBarTheme.shadowColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              spacing: 8,
              children: [
                const NotificationSettingWidget(),
                Divider(color: Theme.of(context).dividerColor),
                const ThemeSettingWidget(),
              ],
            ),
          ),
        ),
      );
}
