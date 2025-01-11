import 'package:flutter/material.dart';

/// Extension for IconData to convert to Icon widget.
extension IconExtension on IconData {
  Icon get toIcon {
    return Icon(this);
  }
}
