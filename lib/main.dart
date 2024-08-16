import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi/constants/theme.dart';

import 'package:sushi/screen/intro_screen.dart';
import 'package:sushi/screen/menu_screen.dart';
import 'package:sushi/store/cart.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: kDebugMode && Platform.isWindows,
      builder: (context) => ChangeNotifierProvider(
        create: (context) => Cart(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sushi app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      home: const IntroScreen(),
      routes: {
        "/intropage": (context) => const IntroScreen(),
        "/menuPage": (context) => MenuScreen(),
      },
    );
  }
}
