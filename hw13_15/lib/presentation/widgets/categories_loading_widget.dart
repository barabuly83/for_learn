import 'package:flutter/material.dart';

class CategoriesLoadingWidget extends StatelessWidget {
  const CategoriesLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}