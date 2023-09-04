import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owl_hris/config/themes/colors.dart';
import 'package:owl_hris/features/absen/presentation/bloc/absent.bloc.dart';
import 'package:owl_hris/features/absen/presentation/bloc/absent.state.dart';

import '../../../../injection.container.dart';
import '../bloc/absent.event.dart';

@RoutePage()
class ClockInScreen extends StatefulWidget implements AutoRouteWrapper {
  const ClockInScreen({super.key});

  @override
  State<ClockInScreen> createState() => _ClockInScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AbsentBloc>(),
      child: this,
    );
  }
}

class _ClockInScreenState extends State<ClockInScreen> {
  late CameraController _controller;
  late List<CameraDescription> listCamera;
  late CameraDescription desc;

  void dispatchGetCameras() {
    BlocProvider.of<AbsentBloc>(context).add(InitCamera());
  }

  Future<CameraDescription> getFrontFaceCamera(
      List<CameraDescription> list) async {
    for (int i = 0; i < list.length; i++) {
      var cam = list[i];
      if (cam.lensDirection == CameraLensDirection.front) {
        // _controller = CameraController(cam, ResolutionPreset.high);
        desc = cam;
      }
    }
    return desc;
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
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        child: CameraPreview(_controller),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        height: double.maxFinite,
                        child: SvgPicture.asset(
                          'assets/image/face-recog-bg.svg',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 96.h),
                          SizedBox(
                            height: 224.h,
                            width: 224.h,
                            child: const CircularProgressIndicator(
                              color: appNotifAbsIcn,
                              strokeWidth: 12,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Text(
                              'Verify to clock in',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: appBgBlack.withOpacity(0.8),
                                fontSize: 32.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Text(
                              'Make sure your face with in the circle while we scan your face',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                                color: appBgBlack.withOpacity(0.5),
                              ),
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
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
    return _controller.value.isInitialized
        ? cameraWidget()
        : const Center(child: CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocConsumer<AbsentBloc, AbsentState>(
          builder: (context, state) {
            if (state is ClockInCameraInitiallized) {
              return widgetFrontFace();
            } else {
              return const CircularProgressIndicator();
            }
          },
          listener: (context, state) {
            if (state is ClockInCameraInitiallized) {
              if (state.listCamera!.isNotEmpty) {
                getFrontFaceCamera(state.listCamera!);
                initCamera(desc);
              }
            }
          },
        ),

        //  BlocListener<AbsentBloc, AbsentState>(
        //   listener: (context, state) {
        //     if (state is ClockInCameraInitiallized) {
        //       getFrontFaceCamera(state.listCamera);
        //       initCamera(desc);
        //     }
        //   },
        //   child: BlocBuilder<AbsentBloc, AbsentState>(
        //     builder: (context, state) {
        //       if (state is ClockInCameraInitiallized) {
        //         return widgetFrontFace();
        //       } else {
        //         return const CircularProgressIndicator();
        //       }
        //     },
        //   ),
        // ),
      ),
    );
  }
}
