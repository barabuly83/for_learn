import 'package:flutter/material.dart';
import 'constants.dart';

class ScreenUtils {
  static bool isWideScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > AppDimens.breakpointWidth;
  }
}
