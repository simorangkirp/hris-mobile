import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/presentation.dart';

@RoutePage()
class MyPersonalInfoScreen extends StatefulWidget {
  const MyPersonalInfoScreen({super.key});

  @override
  State<MyPersonalInfoScreen> createState() => _MyPersonalInfoScreenState();
}

class _MyPersonalInfoScreenState extends State<MyPersonalInfoScreen> {
  final ctrl = PageController(
    initialPage: 0,
  );
  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Personal Information'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocListener<ProfileScreenBloc, ProfileScreenState>(
          listener: (context, state) {},
          child: BlocBuilder<ProfileScreenBloc, ProfileScreenState>(
            builder: (context, state) {
              return PageView(
                scrollDirection: Axis.horizontal,
                controller: ctrl,
                children: <Widget>[
                  detailInfo(),
                  jobHistory(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
