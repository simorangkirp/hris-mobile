import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owl_hris/config/themes/colors.dart';
import 'package:owl_hris/features/absen/presentation/bloc/absent.bloc.dart';
import 'package:owl_hris/features/absen/presentation/bloc/absent.state.dart';

import '../bloc/absent.event.dart';

@RoutePage()
class ClockInScreen extends StatefulWidget {
  const ClockInScreen({super.key});

  @override
  State<ClockInScreen> createState() => _ClockInScreenState();
}

class _ClockInScreenState extends State<ClockInScreen> {
  late CameraController _controller;
  late List<CameraDescription> listCamera;

  void dispatchGetCameras() {
    BlocProvider.of<AbsentBloc>(context).add(InitCamera());
  }

  Future initCamera(CameraDescription cameraDescription) async {
// create a CameraController
    _controller = CameraController(cameraDescription, ResolutionPreset.high);
// Next, initialize the controller. This returns a Future.
    try {
      await _controller.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

  @override
  void initState() {
    super.initState();
    dispatchGetCameras();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  cameraWidget() {
    return FutureBuilder<void>(
      future: _controller.initialize(),
      builder: (context, snapshot) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              alignment: const Alignment(0, 0),
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(360),
                    child: Container(
                      height: 204.h,
                      width: 204.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: appBgBlack,
                      ),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return CameraPreview(_controller);
                        },
                      ),
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: 220.h,
                    width: 220.h,
                    child: const CircularProgressIndicator(
                      color: appNotifAbsIcn,
                      strokeWidth: 12,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  widgetFrontFace() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          SizedBox(height: 84.h),
          _controller.value.isInitialized
              ? cameraWidget()
              : const CircularProgressIndicator(),
          SizedBox(height: 24.h),
          Text(
            'Verify to clock in',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: appBgBlack.withOpacity(0.8),
              fontSize: 32.sp,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'Make sure your face with in the circle while we scan your face',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
              color: appBgBlack.withOpacity(0.5),
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<AbsentBloc, AbsentState>(
            listener: (context, state) {
              if (state is ClockInCameraInitiallized) {
                initCamera(state.listCamera[0]);
              }
            },
          ),
        ],
        child: SafeArea(
          child: BlocBuilder<AbsentBloc, AbsentState>(
            builder: (context, state) {
              if (state is ClockInCameraInitiallized) {
                return widgetFrontFace();
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
