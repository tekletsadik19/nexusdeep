import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nexusdeep/core/extensions/context_extensions.dart';
import 'package:nexusdeep/core/utils/face_detector_painter.dart';
import 'package:nexusdeep/features/profile/presentation/cubits/liveliness_cubit.dart';

class LivelinessScreen extends StatefulWidget {
  const LivelinessScreen({super.key});

  @override
  State<LivelinessScreen> createState() => _LivelinessScreenState();
}

class _LivelinessScreenState extends State<LivelinessScreen> {
  CameraController? _controller;
  List<CameraDescription> cameras = [];
  File? _image;
  String? _path;
  int _cameraIndex = 0;
  double zoomLevel = 0.0, minZoomLevel = 0.0, maxZoomLevel = 0.0;
  final bool _allowPicker = true;
  bool _changingCameraLens = false;

  final FaceDetector faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableClassification: true,
      enableLandmarks: true,
      enableContours: true,
      enableTracking: true,
      performanceMode: FaceDetectorMode.accurate,
    ),
  );

  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  String? _text;

  String rightEye = 'Fit your face in the box';
  String leftEye = 'Fit your face in the box';

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    cameras = await availableCameras();

    _controller = CameraController(
      cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
      ),
      ResolutionPreset.high,
    );
    await _controller!.initialize();
    await _controller!.startImageStream(processCameraImage);

    setState(() {});
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LivelinessCubit, LivelinessState>(
        listener: (context, state) {
          if (state is LivelinessSuccess) {
            // Handle success
          } else if (state is LivelinessFailure) {
            // Handle failure
          }
        },
        builder: (context, state) {
          if (state is LivelinessLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (_controller?.value.isInitialized ?? false) {
            final size = MediaQuery.of(context).size;
            var scale = size.aspectRatio * _controller!.value.aspectRatio;
            if (scale < 1) {
              scale = 1 / scale;
            }

            return Transform.scale(
              scale: scale,
              child: Center(
                child: Stack(
                  children: [
                    CameraPreview(_controller!),
                    if (_customPaint != null) _customPaint!,
                    if (_text != null)
                      Positioned(
                        bottom: 100,
                        left: 40,
                        child: Text(
                          _text!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: SizedBox(
          height: 80,
          width: 80,
          child: FloatingActionButton(
            backgroundColor: context.theme.canvasColor,
            elevation: 0.5,
            isExtended: true,
            splashColor: context.theme.primaryColor.withOpacity(.8),
            onPressed: () async {
              final image = await getImage();
              //context.read<LivelinessCubit>().performLivelinessCheck(LivelinessParams(image: image));
            },
            shape: const CircleBorder(),
            child: Icon(
              Icons.circle,
              size: 78,
              color: context.theme.primaryColor.withOpacity(.6),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<InputImage> getImage() async {
    final file = await _controller!.takePicture();
    return InputImage.fromFilePath(file.path);
  }

  Future<void> processCameraImage(CameraImage cameraImage) async {
    final allBytes = WriteBuffer();
    for (final plane in cameraImage.planes) {
      allBytes.putUint8List(plane.bytes);
    }
    final bytes = allBytes.done().buffer.asUint8List();
    final imageSize =
        Size(cameraImage.width.toDouble(), cameraImage.height.toDouble());
    const imageRotation = InputImageRotation.rotation0deg;
    const inputImageFormat = InputImageFormat.nv21;

    final inputImageData = InputImageMetadata(
      size: imageSize,
      rotation: imageRotation,
      format: inputImageFormat,
      bytesPerRow: cameraImage.planes[0].bytesPerRow,
    );

    final inputImage = InputImage.fromBytes(
      bytes: bytes,
      metadata: inputImageData,
    );

    final faces = await faceDetector.processImage(inputImage);

    if (faces.isEmpty) {
      if (mounted) {
        setState(() {
          _text =
              'No face detected. \nPlease position your face within the frame.';
          _customPaint = null;
        });
      }
    } else {
      if (mounted) {
        setState(() {
          _text = null; // Clear any previous error messages
          _customPaint = CustomPaint(
            painter: FaceDetectorPainter(faces, imageSize, imageRotation),
          );
        });
      }
    }
  }
}
