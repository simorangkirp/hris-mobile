import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MyPersonalInfoScreen extends StatefulWidget {
  const MyPersonalInfoScreen({super.key});

  @override
  State<MyPersonalInfoScreen> createState() => _MyPersonalInfoScreenState();
}

class _MyPersonalInfoScreenState extends State<MyPersonalInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Personal Information'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text('My Info'),
            PageView(
              children: <Widget>[
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
