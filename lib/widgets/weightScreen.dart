import 'package:animated_weight_picker/animated_weight_picker.dart';
import 'package:flutter/material.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({super.key});

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  final double min = 0;
  final double max = 180;
  String selectedValue = '';
  @override
  void initState() {
    selectedValue = min.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Weight Picker'),
      ),
      body: Center(
        child: AnimatedWeightPicker(
          min: min,
          subIntervalHeight: 20,
          squeeze: 3,
          max: max,
          onChange: (newValue) {
            setState(() {
              selectedValue = newValue;
            });
          },
        ),
      ),
    );
  }
}
