import 'dart:convert';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owl_hris/config/config.dart';
import 'package:owl_hris/core/constants/constants.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

@RoutePage()
class PaidLeaveCameraScreen extends StatefulWidget {
  const PaidLeaveCameraScreen({
    super.key,
  });

  @override
  State<PaidLeaveCameraScreen> createState() => _PaidLeaveCameraScreenState();
}

class _PaidLeaveCameraScreenState extends State<PaidLeaveCameraScreen> {
  late CameraController _controller;
  late List<CameraDescription> listCamera;
  late CameraDescription desc;
  bool isProcess = false;
  Future<void>? _initializeControllerFuture;
  Uint8List? imgData;
  static GlobalKey ssKey = GlobalKey();
  String? photo;

  Future<void> getFrontFaceCamera(List<CameraDescription> list) async {
    for (int i = 0; i < list.length; i++) {
      var cam = list[i];
      if (cam.lensDirection == CameraLensDirection.front) {
        // _controller = CameraController(cam, ResolutionPreset.high);
        desc = cam;
      }
    }
  }

  Future initCamera(CameraDescription cameraDescription) async {
    _controller = CameraController(cameraDescription, ResolutionPreset.high);
    try {
      await _controller.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

  Future<bool> getImage() async {
    RenderRepaintBoundary bound =
        ssKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image img = await bound.toImage(pixelRatio: 1.0);
    ByteData? byte = await img.toByteData(
      format: ui.ImageByteFormat.png,
    );
    imgData = byte?.buffer.asUint8List(byte.offsetInBytes, byte.lengthInBytes);

    if (byte != null) {
      Uint8List headedData = Uint8List.view(byte.buffer);
      photo = base64Encode(headedData);
    }
    if (photo != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    // dispatchGetCameras();
    startCamera();
  }

  Future<void> startCamera() async {
    listCamera = await availableCameras();
    await getFrontFaceCamera(listCamera).then((value) {
      _initializeControllerFuture = initCamera(desc);
    });
  }

  late final cameraInit = Future.wait([
    startCamera(),
  ]);

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _initializeControllerFuture = _controller
          .initialize(); //on pause camera is disposed, so we need to call again "issue is only for android"
    }
  }

  navigateBack() {
    _controller.dispose().then((value) {
      context.router.navigate(PaidLeaveFormRoute(param: photo));
    });
  }

  cameraWidget(BuildContext context) {
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            children: [
              RepaintBoundary(
                key: ssKey,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SizedBox(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      child: CameraPreview(_controller),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 32.h,
                right: 32.h,
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      isProcess = true;
                    });
                    getImage().then((value) {
                      if (value) {
                        navigateBack();
                      } else {
                        setState(() {
                          isProcess = false;
                        });
                      }
                    });
                  },
                  child: SvgPicture.asset(
                    ConstIconPath.cameraIcon,
                    colorFilter:
                        const ColorFilter.mode(appBgBlack, BlendMode.srcIn),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.router.navigate(PaidLeaveFormRoute());
          },
        ),
      ),
      body: SafeArea(
        child: isProcess
            ? const Center(child: CircularProgressIndicator())
            : cameraWidget(context),
      ),
    );
  }
}
