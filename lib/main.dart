import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jakarta_suite/calculator/adwaita/calculator_adw.dart';
import 'package:jakarta_suite/calculator/fluent/calculator_fluent.dart';
import 'package:system_theme/system_theme.dart';

import 'calculator/material/calculator_mt.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart' as flutter_acrylic;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb && (Platform.isLinux || Platform.isWindows)) {
    doWhenWindowReady(() {
      final initialSize = Size(600, 855);
      appWindow.minSize = initialSize;
      appWindow.size = initialSize;
      appWindow.alignment = Alignment.topLeft;
      appWindow.title = 'Calcs';
      appWindow.show();
    });
  }

  if (Platform.isWindows) {
    await flutter_acrylic.Window.initialize();
    await flutter_acrylic.Window.hideWindowControls();
    // await flutter_acrylic.Window.setWindowAlphaValue(.6);
    await SystemTheme.accentInstance.load();
  }

  if (Platform.isLinux) {}

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isLinux) {
      return CalculatorAdw();
    }

    if (Platform.isWindows) {
      return CalculatorFluent();
    }

    return MaterialApp(
      title: 'Jakarta Suite Apps',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Builder(builder: (context) {
          return SizedBox(
            width: MediaQuery.of(context).size.width * .6,
            child: Center(
              child: Wrap(children: [
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
              ]),
            ),
          );
        }),
      ),
    );
  }
}
