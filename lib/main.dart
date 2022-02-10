import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jakarta_suite/calculator/adwaita/calculator_adw.dart';

void main() => runApp(MyApp());

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
                            builder: ((context) => const CalculatorAdw()))),
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
