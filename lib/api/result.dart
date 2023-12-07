import 'package:flutter/material.dart';
import 'package:qr_code/api/services.dart';

class Result extends StatefulWidget {
  Result({super.key, required this.qr_value});
  String qr_value;

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  void initState() {
    ApiServices().getSearch(value: widget.qr_value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Result Screen "),
        ],
      ),
    );
  }
}
