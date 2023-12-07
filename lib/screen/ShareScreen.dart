// import 'dart:typed_data';

// import 'package:flutter/material.dart';

// import 'package:flutter/rendering.dart';
// import 'package:qr_flutter/qr_flutter.dart';

// class ShareScreen extends StatelessWidget {
//   const ShareScreen({super.key});
//   Future<Uint8List> _getWidgetImage() async {
//     try {
//       var _renderObjectKey;
//       RenderRepaintBoundary boundary =
//           _renderObjectKey.currentContext.findRenderObject();
//       ui.Image image = await boundary.toImage(pixelRatio: 3.0);
//       ByteData byteData =
//           await image.toByteData(format: ui.ImageByteFormat.png);
//       var pngBytes = byteData.buffer.asUint8List();
//       var bs64 = base64Encode(pngBytes);
//       debugPrint(bs64.length.toString());
//       return pngBytes;
//     } catch (exception) {
//       print(exception);
//     }
//   }

//   base64Encode(Uint8List pngBytes) {}
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         RepaintBoundary(
//           key: _renderObjectKey,
//           child: QrImageView(
//             data: "some text",
//             size: 150.0,
//             version: 10,
//             backgroundColor: Colors.white,
//           ),
//         ),
//       ],
//     ));
//   }
// }

// import 'dart:typed_data';
// import 'dart:ui'
//     as ui; // Import 'ui' from 'dart:ui' to use 'Image' and 'ImageByteFormat'

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:qr_flutter/qr_flutter.dart';

// class ShareScreen extends StatelessWidget {
//   ShareScreen({Key? key}) : super(key: key); // Fix constructor syntax
//   final _renderObjectKey = GlobalKey();
//   Future<Uint8List?> _getWidgetImage() async {
//     try {
//       // Create GlobalKey instance
//       RenderRepaintBoundary boundary = _renderObjectKey.currentContext!
//           .findRenderObject() as RenderRepaintBoundary;
//       ui.Image image = await boundary.toImage(pixelRatio: 3.0);
//       ByteData? byteData =
//           await image.toByteData(format: ui.ImageByteFormat.png);
//       var pngBytes = byteData?.buffer.asUint8List();
//       return pngBytes;
//     } catch (exception) {
//       print(exception);
//       return Uint8List(0); // Return an empty list or handle the error as needed
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           RepaintBoundary(
//             key: _renderObjectKey,
//             // Use the GlobalKey here
//             child: QrImageView(
//               // Replace QrImageView with QrImage
//               data: "some text",
//               version: QrVersions.auto,
//               size: 150.0,
//               backgroundColor: Colors.white,
//             ),
//           ),
//           MaterialButton(
//             color: Colors.blue,
//             onPressed: () {
//               _getWidgetImage();
//             },
//             child: const Text("getImage"),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:universal_html/html.dart' as html;

class ShareScreen extends StatefulWidget {
  const ShareScreen({Key? key}) : super(key: key);

  @override
  _ShareScreenState createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  final _renderObjectKey = GlobalKey();

  Uint8List? capturedImage;

  Future<void> _getWidgetImage() async {
    try {
      RenderRepaintBoundary boundary = _renderObjectKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData?.buffer.asUint8List();
      setState(() {
        capturedImage = pngBytes;
      });
    } catch (exception) {
      print(exception);
      // Handle the error as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RepaintBoundary(
            key: _renderObjectKey,
            child: QrImageView(
              data: "iuhwefuheuhuid",
              version: QrVersions.auto,
              size: 150.0,
              backgroundColor: Colors.white,
            ),
          ),
          MaterialButton(
            color: Colors.blue,
            onPressed: () {
              _getWidgetImage();
            },
            child: const Text("Capture Image"),
          ),
          if (capturedImage != null)
            Image.memory(
              capturedImage!,
              width: 150, // Set the width and height as needed
              height: 150,
            ),
          const SizedBox(
            height: 50,
          ),
          Container(
              alignment: Alignment.center,
              child: GestureDetector(
                  onTap: () async {
                    if (capturedImage != null) {
                      final tempDir = await getTemporaryDirectory();
                      final file = File('${tempDir.path}/qr_code.png');
                      await file.writeAsBytes(capturedImage!);
                      await Share.shareFiles([file.path]);
                    }
                    // if (capturedImage != null) {
                    //   final blob =
                    //       html.Blob([Uint8List.fromList(capturedImage!)]);
                    //   final blobUrl = html.Url.createObjectUrlFromBlob(blob);

                    //   final anchor = html.AnchorElement(href: blobUrl)
                    //     ..target = 'blob'
                    //     ..download = 'qr_code.png'
                    //     ..click();
                    // }
                  },
                  child: const Icon(Icons.share))),
        ],
      ),
    );
  }

  Future<void> _shareImage() async {
    if (capturedImage != null) {
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/qr_code.png');
      await file.writeAsBytes(capturedImage!);
      await Share.shareFiles([file.path]);
    }
  }
}
