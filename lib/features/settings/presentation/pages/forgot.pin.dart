import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ForgotPINScreen extends StatefulWidget {
  const ForgotPINScreen({super.key});

  @override
  State<ForgotPINScreen> createState() => _ForgotPINScreenState();
}

class _ForgotPINScreenState extends State<ForgotPINScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [],
      ),
    );
  }
}
