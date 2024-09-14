import 'package:flutter/material.dart';
import 'package:projectorders/InheritedWidget/app_data.dart';

class AppDataProvider extends InheritedWidget {
  final AppData data;

  const AppDataProvider({super.key, required this.data, required super.child});

  static AppDataProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppDataProvider>();
  }

  @override
  bool updateShouldNotify(AppDataProvider oldWidget) {
    return data != oldWidget.data; // Notify widgets when the data changes
  }
}
