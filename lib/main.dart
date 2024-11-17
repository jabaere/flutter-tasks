import 'dart:async';

import 'package:flutter/material.dart';

import 'screens/login.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //  debugShowMaterialGrid: true,
      title: '',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: colorScheme.onSurfaceVariant,
          surface: colorScheme.onPrimary,
          // ···
          brightness: Brightness.light,
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
