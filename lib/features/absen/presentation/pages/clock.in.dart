import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owl_hris/config/themes/colors.dart';

@RoutePage()
class ClockInScreen extends StatefulWidget {
  const ClockInScreen({super.key});

  @override
  State<ClockInScreen> createState() => _ClockInScreenState();
}

class _ClockInScreenState extends State<ClockInScreen> {
  late CameraController _controller;
  // late Future<void> _initializeControllerFuture;
  late List<CameraDescription> listCamera;

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

  Future<List<CameraDescription>> openCamera() async {
    // Obtain a list of the available cameras on the device.
    final listCamera = await availableCameras();

    // Get a specific camera from the list of available cameras.
    // final firstCamera = cameras.first;
    return listCamera;
  }

  @override
  void initState() {
    super.initState();
    openCamera();
    initCamera(listCamera.first);
    // _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 84.h),
              _controller.value.isInitialized
                  ? Stack(
                      alignment: const Alignment(0, 0),
                      children: [
                        Center(
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
                    )
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
        ),
      ),
    );
  }
}
