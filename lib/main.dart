import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:jakarta_suite/calculator/adwaita/calculator_adw.dart';

import 'calculator/material/calculator_mt.dart';

void main() {
  runApp(MyApp());

  doWhenWindowReady(() {
    final initialSize = Size(600, 855);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isLinux) {
      return CalculatorAdw();
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
