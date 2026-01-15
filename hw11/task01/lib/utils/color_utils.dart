import 'package:flutter/material.dart';

class ColorUtils {
  static Color getAvatarColor(String colorName) {
    switch (colorName) {
      case 'blue':
        return Colors.blue;
      case 'pink':
        return Colors.pink;
      case 'green':
        return Colors.green;
      case 'purple':
        return Colors.purple;
      case 'orange':
        return Colors.orange;
      case 'teal':
        return Colors.teal;
      case 'indigo':
        return Colors.indigo;
      case 'red':
        return Colors.red;
      default:
        return Colors.blue;
    }
  }
}