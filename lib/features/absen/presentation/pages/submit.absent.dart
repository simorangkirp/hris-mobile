import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SubmitAbsentScreen extends StatefulWidget {
  const SubmitAbsentScreen({super.key});

  @override
  State<SubmitAbsentScreen> createState() => _SubmitAbsentScreenState();
}

class _SubmitAbsentScreenState extends State<SubmitAbsentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('Date'),
          Text('Assignment Location'),
          Text('Time'),
        ],
      ),
    );
  }
}
