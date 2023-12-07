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
        child: QrImageView(
          data: "iy4ruq4ueufgeufguegfue", //hussein huauu ahuhsu
          size: 150,
          version: QrVersions.auto,
        ),
      ),
    );
  }
}
