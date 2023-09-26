import 'dart:convert';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
// import 'package:bitmap/bitmap.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owl_hris/config/config.dart';
import 'package:owl_hris/core/constants/constants.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

import '../../absen.dart';

@RoutePage()
class AbsentCameraScreen extends StatefulWidget {
  const AbsentCameraScreen({
    @PathParam('params') this.photoParam,
    @PathParam('period') this.period,
    @PathParam('inout') this.inout,
    super.key,
  });
  final String? photoParam;
  final String? period, inout;

  @override
  State<AbsentCameraScreen> createState() => _AbsentCameraScreenState();
}

class _AbsentCameraScreenState extends State<AbsentCameraScreen> {
  late CameraController _controller;
  late List<CameraDescription> listCamera;
  late CameraDescription desc;
  bool isProcess = false;
  Uint8List? imgData;
  static GlobalKey ssKey = GlobalKey();
  String? param;

  void dispatchGetCameras() {
    BlocProvider.of<AbsentBloc>(context).add(InitCamera());
  }

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
      param = base64Encode(headedData);
    }

    if (imgData != null) {
      // List<int> imgList = imgData!.map((e) => e.toInt()).toList();
      // Bitmap bitmap = Bitmap.fromHeadless(300, 300, imgData!);
      // Uint8List headedBitmap = bitmap.buildHeaded();
      // param = base64Encode(headedBitmap);
      // param = base64Encode(imgData!);
    }
    // if (imgData != null) {
    //   param = base64.encode(imgData!);
    // }
    // if (imgData != null) {
    //   param = convertUint8ListToString(imgData!);
    // }
    if (param != null) {
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
    await getFrontFaceCamera(listCamera);
    initCamera(desc);
  }

  late final cameraInit = Future.wait([
    startCamera(),
  ]);

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  navigateBack() {
    context.router.navigate(SubmitAbsentRoute(
        photoParam: param ?? "", inout: widget.inout, period: widget.period));
  }

  cameraWidget(BuildContext context) {
    return FutureBuilder<void>(
      future: cameraInit,
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
              // Positioned(
              //   right: 0,
              //   left: 0,
              //   bottom: 24,
              //   child: Container(
              //     decoration: BoxDecoration(
              //       shape: BoxShape.circle,
              //       color: appBgTransparent,
              //       border: Border.all(color: appBgWhite, width: 6),
              //     ),
              //     height: 72.h,
              //     width: double.maxFinite,
              //     child: Center(
              //       child: Container(
              //         height: 52.h,
              //         width: double.maxFinite,
              //         decoration: const BoxDecoration(
              //           shape: BoxShape.circle,
              //           color: appBgWhite,
              //         ),
              //         child: Center(
              //           child: SizedBox(
              //             height: 24.h,
              //             width: 24.h,
              //             child: SvgPicture.asset(
              //               ConstIconPath.cameraIcon,
              //               colorFilter: const ColorFilter.mode(
              //                   appBgBlack, BlendMode.srcIn),
              //               fit: BoxFit.cover,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
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

  // widgetFrontFace() {
  //   return _controller.value.isInitialized
  //       ? cameraWidget()
  //       : const Center(child: CircularProgressIndicator());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.router.navigate(SubmitAbsentRoute());
          },
        ),
      ),
      body: SafeArea(
        child: isProcess
            ? const Center(child: CircularProgressIndicator())
            : cameraWidget(context),
        //     child: BlocListener<AbsentBloc, AbsentState>(
        //   listener: (context, state) {
        //     if (state is ClockInCameraInitiallized) {
        //       if (state.listCamera!.isNotEmpty) {
        //         getFrontFaceCamera(state.listCamera!);
        //         initCamera(desc);
        //       }
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
        // )

        // BlocConsumer<AbsentBloc, AbsentState>(
        //   builder: (context, state) {
        //     if (state is ClockInCameraInitiallized) {
        //       return widgetFrontFace();
        //     } else {
        //       return const CircularProgressIndicator();
        //     }
        //   },
        //   listener: (context, state) {
        //     if (state is ClockInCameraInitiallized) {
        //       if (state.listCamera!.isNotEmpty) {
        //         getFrontFaceCamera(state.listCamera!);
        //         initCamera(desc);
        //       }
        //     }
        //   },
        // ),
      ),
    );
  }
}
