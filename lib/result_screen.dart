import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Container(
          height: 366,
          width: 337,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xff197B8D)),
          child: QrImageView(
            padding: const EdgeInsets.all(50),
            // dataModuleStyle: const QrDataModuleStyle(color: Colors.white),
            // eyeStyle: const QrEyeStyle(
            //     eyeShape: QrEyeShape.square, color: Colors.white),

            foregroundColor: Colors.white,
            data: "sports", //hussein huauu ahuhsu
            size: 100,
            version: QrVersions.auto,
          ),
        ),
      ),
    );
  }
}
