import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jakarta_suite/calculator/adwaita/calculator_adw.dart';
import 'package:jakarta_suite/calculator/fluent/calculator_fluent.dart';
import 'package:system_theme/system_theme.dart';

import 'app_theme/app_theme.dart';
import 'app_theme/theme1.dart';
import 'calculator/material/calculator_mt.dart';

import 'calculator/material/calculator_mt.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart' as flutter_acrylic;

const AppTheme appTheme = themeLight;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb && (Platform.isLinux || Platform.isWindows)) {
    doWhenWindowReady(() {
      const initialSize = Size(600, 855);

      appWindow
        ..minSize = initialSize
        ..size = initialSize
        ..alignment = Alignment.topLeft
        ..title = 'Calcs'
        ..show();
    });
  }

  if (Platform.isWindows) {
    await flutter_acrylic.Window.initialize();
    await flutter_acrylic.Window.hideWindowControls();
    await SystemTheme.accentInstance.load();
  }

  if (Platform.isLinux) {}

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (Platform.isLinux) {
      return const CalculatorAdw();
    }

    if (Platform.isWindows) {
      return const CalculatorFluent();
    }

    return MaterialApp(
      title: 'Jakarta Suite Apps',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Builder(builder: (context) {
          return SizedBox(
            width: MediaQuery.of(context).size.width * .6,
            child: Center(
              child: Wrap(
                children: [
                  GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const CalculatorMt()))),
                      child: Row(
                        children: const [
                          Icon(Icons.calculate),
                          Text('Calculator')
                        ],
                      ))
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
