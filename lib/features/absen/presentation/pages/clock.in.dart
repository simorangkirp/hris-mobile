// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_ml_vision/google_ml_vision.dart';
import 'package:owl_hris/config/themes/colors.dart';
import 'package:owl_hris/features/absen/presentation/bloc/absent.bloc.dart';
import 'package:owl_hris/features/absen/presentation/bloc/absent.state.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:tflite_flutter/tflite_flutter.dart';
// import 'package:quiver/collection.dart';
import '../../../../injection.container.dart';
import '../bloc/absent.event.dart';
// import 'package:flutter/services.dart';
// import 'package:image/image.dart' as imglib;

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
  // File? jsonFile;
  // dynamic data = {};
  // bool _isDetecting = false;
  // bool _faceFound = false;
  // Directory? tempDir;
  // var interpreter;
  // final FaceDetector _faceDetector = GoogleVision.instance
  //     .faceDetector(const FaceDetectorOptions(enableContours: true));

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
    // await loadModel();
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
    // tempDir = await getApplicationDocumentsDirectory();
    // String _embPath = tempDir!.path + '/emb.json';
    // jsonFile = File(_embPath);
    // if (jsonFile!.existsSync()) {
    //   data = json.decode(jsonFile!.readAsStringSync());
    // }

    // _controller.startImageStream((CameraImage image) {
    //   if (_isDetecting) return;
    //   _isDetecting = true;
    //   String res;
    //   dynamic finalResult = Multimap<String, Face>();
    //   detect(
    //           image: image,
    //           detectInImage: _getDetectionMethod(),
    //           imageRotation: cameraDescription.sensorOrientation)
    //       .then((dynamic result) async {
    //     if (result.length == 0) {
    //       _faceFound = false;
    //     } else {
    //       _faceFound = true;
    //     }
    //     Face _face;
    //     imglib.Image convertedImage = _convertCameraImage(image, _direction);
    //   });
    //   for (_face in result) {
    //     double x, y, w, h;
    //     x = (_face.boundingBox.left - 10);
    //     y = (_face.boundingBox.top - 10);
    //     w = (_face.boundingBox.width + 10);
    //     h = (_face.boundingBox.height + 10);
    //     imglib.Image croppedImage = imglib.copyCrop(
    //         convertedImage, x.round(), y.round(), w.round(), h.round());
    //     croppedImage = imglib.copyResizeCropSquare(croppedImage, 112);
    //     // int startTime =  DateTime.now().millisecondsSinceEpoch;
    //     res = _recog(croppedImage);
    //     // int endTime =  DateTime.now().millisecondsSinceEpoch;
    //     // print("Inference took ${endTime - startTime}ms");
    //     finalResult.add(res, _face);
    //   }
    //   setState(() {
    //     _scanResults = finalResult;
    //   });

    //   _isDetecting = false;
    // }).catchError(
    //   (_) {
    //     _isDetecting = false;
    //   },
    // );
  }

  // Future loadModel() async {
  //   try {
  //     final gpuDelegateV2 = GpuDelegateV2(
  //         options: GpuDelegateOptionsV2(
  //       isPrecisionLossAllowed: false,
  //       inferencePriority1: 0,
  //       inferencePriority2: 0,
  //       inferencePriority3: 0,
  //       // false,
  //       // TfLiteGpuInferenceUsage.fastSingleAnswer,
  //       // TfLiteGpuInferencePriority.minLatency,
  //       // TfLiteGpuInferencePriority.auto,
  //       // TfLiteGpuInferencePriority.auto,
  //     ));

  //     var interpreterOptions = InterpreterOptions()..addDelegate(gpuDelegateV2);
  //     interpreter = await Interpreter.fromAsset('mobilefacenet.tflite',
  //         options: interpreterOptions);
  //   } on Exception {
  //     log('Failed to load model.');
  //   }
  // }

  // Future<dynamic> Function(GoogleVisionImage visionImage)
  //     _getDetectionMethod() {
  //   return _faceDetector.processImage;
  // }

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

// GoogleVisionImageMetadata buildMetaData(
//   CameraImage image,
//   ImageRotation rotation,
// ) {
//   return GoogleVisionImageMetadata(
//     rawFormat: image.format.raw,
//     size: Size(image.width.toDouble(), image.height.toDouble()),
//     rotation: rotation,
//     planeData: image.planes.map(
//       (Plane plane) {
//         return GoogleVisionImagePlaneMetadata(
//           bytesPerRow: plane.bytesPerRow,
//           height: plane.height,
//           width: plane.width,
//         );
//       },
//     ).toList(),
//   );
// }

// Future<dynamic> detect({
//   CameraImage? image,
//   Future<dynamic>? Function(GoogleVisionImage image)? detectInImage,
//   int? imageRotation,
// }) async {
//   return detectInImage!(
//     GoogleVisionImage.fromBytes(
//       _concatenatePlanes(image!.planes),
//       buildMetaData(image, _rotationIntToImageRotation(imageRotation!)),
//     ),
//   );
// }

// Uint8List _concatenatePlanes(List<Plane> planes) {
//   final WriteBuffer allBytes = WriteBuffer();
//   planes.forEach((Plane plane) => allBytes.putUint8List(plane.bytes));
//   return allBytes.done().buffer.asUint8List();
// }

// ImageRotation _rotationIntToImageRotation(int rotation) {
//   switch (rotation) {
//     case 0:
//       return ImageRotation.rotation0;
//     case 90:
//       return ImageRotation.rotation90;
//     case 180:
//       return ImageRotation.rotation180;
//     default:
//       assert(rotation == 270);
//       return ImageRotation.rotation270;
//   }
// }

// Float32List imageToByteListFloat32(
//     imglib.Image image, int inputSize, double mean, double std) {
//   var convertedBytes = Float32List(1 * inputSize * inputSize * 3);
//   var buffer = Float32List.view(convertedBytes.buffer);
//   int pixelIndex = 0;
//   for (var i = 0; i < inputSize; i++) {
//     for (var j = 0; j < inputSize; j++) {
//       var pixel = image.getPixel(j, i);
//       buffer[pixelIndex++] = (imglib.getRed(pixel) - mean) / std;
//       buffer[pixelIndex++] = (imglib.getGreen(pixel) - mean) / std;
//       buffer[pixelIndex++] = (imglib.getBlue(pixel) - mean) / std;
//     }
//   }
//   return convertedBytes.buffer.asFloat32List();
// }

// double euclideanDistance(List e1, List e2) {
//   double sum = 0.0;
//   for (int i = 0; i < e1.length; i++) {
//     sum += pow((e1[i] - e2[i]), 2);
//   }
//   return sqrt(sum);
// }


// imglib.Image _convertCameraImage(
//       CameraImage image, CameraLensDirection _dir) {
//     int width = image.width;
//     int height = image.height;
//     // imglib -> Image package from https://pub.dartlang.org/packages/image
//     var img = imglib.Image(width, height); // Create Image buffer
//     const int hexFF = 0xFF000000;
//     final int uvyButtonStride = image.planes[1].bytesPerRow;
//     final int uvPixelStride = image.planes[1].bytesPerPixel!;
//     for (int x = 0; x < width; x++) {
//       for (int y = 0; y < height; y++) {
//         final int uvIndex =
//             uvPixelStride * (x / 2).floor() + uvyButtonStride * (y / 2).floor();
//         final int index = y * width + x;
//         final yp = image.planes[0].bytes[index];
//         final up = image.planes[1].bytes[uvIndex];
//         final vp = image.planes[2].bytes[uvIndex];
//         // Calculate pixel color
//         int r = (yp + vp * 1436 / 1024 - 179).round().clamp(0, 255);
//         int g = (yp - up * 46549 / 131072 + 44 - vp * 93604 / 131072 + 91)
//             .round()
//             .clamp(0, 255);
//         int b = (yp + up * 1814 / 1024 - 227).round().clamp(0, 255);
//         // color: 0x FF  FF  FF  FF
//         //           A   B   G   R
//         img.data[index] = hexFF | (b << 16) | (g << 8) | r;
//       }
//     }
//     var img1 = (_dir == CameraLensDirection.front)
//         ? imglib.copyRotate(img, -90)
//         : imglib.copyRotate(img, 90);
//     return img1;
//   }