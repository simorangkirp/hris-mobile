import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Change password'),
      ),
      body: Column(
        children: [
          Text('Reset password'),
          Text(
              "Please insert your account password, we'll send OTP code to your connected number."),
          Text('Password'),
        ],
      ),
    );
  }
}
