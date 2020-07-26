import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' show CupertinoThemeData;

import 'package:activity_ring_example/homepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const TraitApp());
}

/// Main Application.
class TraitApp extends StatelessWidget {
  // ignore: public_member_api_docs
  const TraitApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bajat',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        cupertinoOverrideTheme: const CupertinoThemeData(
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.dark,
      // Use this instead of home so that we get the modal effect
      // for home screen
      // onGenerateRoute: router,
      home: const HomePage(),
    );
  }
}
