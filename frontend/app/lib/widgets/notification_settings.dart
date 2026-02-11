import 'package:flutter/material.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  bool emailNotification = true;
  bool pushNotification = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SwitchListTile(
            title: const Text("Email Notifications"),
            value: emailNotification,
            onChanged: (value) {
              setState(() {
                emailNotification = value;
              });
            },
          ),

          SwitchListTile(
            title: const Text("Push Notifications"),
            value: pushNotification,
            onChanged: (value) {
              setState(() {
                pushNotification = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
