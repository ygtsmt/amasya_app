import "package:amasyaapp/app/ui/widgets/revo_screen_header.dart";
import "package:amasyaapp/core/services/ocr_service.dart";
import "package:camera/camera.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart";

class ScanDriverLicenceScreen extends StatefulWidget {
  const ScanDriverLicenceScreen({
    super.key,
  });

  @override
  _ScanDriverLicenceScreenState createState() => _ScanDriverLicenceScreenState();
}

class _ScanDriverLicenceScreenState extends State<ScanDriverLicenceScreen> {
  CameraController? controller;
  bool isScanning = false;

  @override
  void initState() {
    initScanner();
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Future<void> initScanner() async {
    availableCameras().then((final value) {
      controller = CameraController(
        value.first,
        ResolutionPreset.max,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.bgra8888,
      );
      controller!.initialize().then((final _) {
        controller!.startImageStream((final image) async {
          if (!isScanning) {
            isScanning = true;
            try {
              final inputImage = getInputImage(image);
              final textDetector = TextRecognizer();
              final recognizedText = await textDetector.processImage(inputImage);

              final licenceModelOcr = OCRFunctions().getLicenseData(recognizedText);

              if (licenceModelOcr.licenceNumber.isNotEmpty &&
                  licenceModelOcr.firstName.isNotEmpty &&
                  licenceModelOcr.lastName.isNotEmpty &&
                  licenceModelOcr.dob.isNotEmpty) {
                // ignore: use_build_context_synchronously
                /*  context.router
                    .replace(
                      CustomerScreenRoute(
                        name: licenceModelOcr.firstName,
                        surname: licenceModelOcr.lastName,
                        birthDate: licenceModelOcr.dob.replaceAll(".", "/"),
                        licenceNumber: licenceModelOcr.licenceNumber,
                      ),
                    )
                    .then((final _) {});
                isScanning = false;
                controller?.dispose(); */
              } else {
                isScanning = false;
              }
            } catch (e) {
              isScanning = false;
            }
          }
        });
        if (!mounted) {
          return;
        }
        setState(() {});
      }).catchError((final Object e) {
        if (e is CameraException) {
          switch (e.code) {
            case "CameraAccessDenied":
              // print("User denied camera access.");
              break;
            default:
              // print("Handle other errors.");
              break;
          }
        }
      });
    });
  }

  InputImage getInputImage(final CameraImage cameraImage) {
    final WriteBuffer allBytes = WriteBuffer();
    for (final Plane plane in cameraImage.planes) {
      allBytes.putUint8List(plane.bytes);
    }
    final bytes = allBytes.done().buffer.asUint8List();

    final Size imageSize = Size(cameraImage.width.toDouble(), cameraImage.height.toDouble());

    final InputImageRotation imageRotation =
        InputImageRotationValue.fromRawValue(controller!.description.sensorOrientation) ??
            InputImageRotation.rotation0deg;

    final planeData = cameraImage.planes.map(
      (final Plane plane) {
        return InputImagePlaneMetadata(
          bytesPerRow: plane.bytesPerRow,
          height: plane.height,
          width: plane.width,
        );
      },
    ).toList();

    final inputImageData = InputImageData(
      size: imageSize,
      imageRotation: imageRotation,
      inputImageFormat: InputImageFormat.bgra8888,
      planeData: planeData,
    );

    return InputImage.fromBytes(bytes: bytes, inputImageData: inputImageData);
  }

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const RevoScreenHeader(
          title: "Scan card",
        ),
        Expanded(
          flex: 6,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              child: controller == null
                  ? const Center(
                      child: Text(
                        "Kamera Yükleniyor",
                      ),
                    )
                  : !controller!.value.isInitialized
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : CameraPreview(controller!),
            ),
          ),
        ),
      ],
    );
  }
}
