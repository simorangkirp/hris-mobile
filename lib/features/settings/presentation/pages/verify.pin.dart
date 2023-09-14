import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../presentation.dart';

@RoutePage()
class VerifyPINScreen extends StatefulWidget {
  const VerifyPINScreen({super.key});

  @override
  State<VerifyPINScreen> createState() => _VerifyPINScreenState();
}

class _VerifyPINScreenState extends State<VerifyPINScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: verifyPin(context),
    );
  }
}
