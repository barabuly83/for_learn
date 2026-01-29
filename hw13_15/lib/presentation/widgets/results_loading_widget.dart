import 'package:flutter/material.dart';

class ResultsLoadingWidget extends StatelessWidget {
  const ResultsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}