import 'package:flutter/material.dart';
import 'objectbox.g.dart';
import 'screens/login.dart';

late Store _store;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final store = await openStore();
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store store;

  const MyApp({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: colorScheme.onSurfaceVariant,
          surface: colorScheme.onPrimary,
          brightness: Brightness.light,
        ),
      ),
      home: LoginScreen(store: store),
    );
  }
}
