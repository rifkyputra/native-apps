import 'package:adwaita/adwaita.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jakarta_suite/calculator/cubit/calculator_cubit.dart';
import 'package:libadwaita/libadwaita.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

import '../shared/parts.dart';

class CalculatorAdw extends StatelessWidget {
  const CalculatorAdw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AdwaitaThemeData.dark(),
      darkTheme: AdwaitaThemeData.dark(),
      home: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // AdwHeaderBar.bitsdojo(
          //   appWindow: appWindow,
          //   title: Text('hsdkfh'),
          //   closeBtn: Icon(Icons.close),
          //   windowDecor: (String name, type, void Function()? onPressed) {  },
          // ),
          AdwHeaderBar.bitsdojo(
            appWindow: appWindow,
            start: [
              Builder(
                builder: (context) {
                  return AdwHeaderButton(
                    icon: const Icon(Icons.view_sidebar, size: 15),
                    isActive: false,
                    onPressed: () {},
                  );
                },
              ),
              AdwHeaderButton(
                icon: const Icon(Icons.nightlight_round, size: 15),
              ),
            ],
            title: const Text('Libadwaita Demo'),
            end: [
              AdwPopupMenu(
                body: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AdwButton.flat(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      padding: AdwButton.defaultButtonPadding.copyWith(
                        top: 10,
                        bottom: 10,
                      ),
                      child: const Text(
                        'Reset Counter',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    const Divider(),
                    AdwButton.flat(
                      padding: AdwButton.defaultButtonPadding.copyWith(
                        top: 10,
                        bottom: 10,
                      ),
                      child: const Text(
                        'Preferences',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            windowDecor: (String name, type, void Function()? onPressed) {
              // return CloseWindowButton();
              switch (name) {
                case 'close':
                  return CloseWindowButton();
                case 'minimize':
                  return MinimizeWindowButton();
                case 'maximize':
                  return MaximizeWindowButton();
                default:
              }
              return Row(
                children: [
                  MinimizeWindowButton(),
                  MaximizeWindowButton(),
                  CloseWindowButton(),
                ],
              );
            },
            // windowDecor: (String name, type, void Function()? onPressed) {
            //   return Text('sss');
            // },
          ),
          BlocProvider(
            create: (context) => CalculatorCubit(),
            child: Expanded(
              child: AdwScaffold(
                body: const CalculatorAdwHome(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CalculatorAdwHome extends StatelessWidget {
  const CalculatorAdwHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResultView(),
          CalcButton(),
        ]);
  }
}
