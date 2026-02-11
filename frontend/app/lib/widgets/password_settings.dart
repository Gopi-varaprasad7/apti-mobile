import 'package:flutter/material.dart';

class PasswordSettings extends StatelessWidget {
  const PasswordSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Current Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 16),

          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: "New Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 16),

          ElevatedButton(
            onPressed: () {},
            child: const Text("Update Password"),
          ),
        ],
      ),
    );
  }
}
