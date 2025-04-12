import 'package:flutter/material.dart';

class GlobalFunctions {
  static IconData getIconData({
    required int? iconCodePoint,
    required String? iconFontFamily,
  }) {
    if (iconCodePoint == null || iconFontFamily == null) {
      return Icons.error;
    }

    return IconData(
      iconCodePoint,
      fontFamily: iconFontFamily,
      fontPackage: 'line_icons',
    );
  }
}
