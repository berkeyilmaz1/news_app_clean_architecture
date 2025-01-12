import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/config/application_start/application_start.dart';
import 'package:news_app/config/main_app/main_app.dart';

/// The entry point of the application.
/// Initializes the application and runs the main app.
void main() async {
  await ApplicationStart.initialize();
  runApp(const ProviderScope(child: MainApp()));
}
