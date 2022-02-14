import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jakarta_suite/app_theme/theme1.dart';
import 'package:jakarta_suite/calculator/cubit/calculator_cubit.dart';

import '../shared/parts.dart';

class CalculatorMt extends StatelessWidget {
  const CalculatorMt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeLight.themeData,
      darkTheme: themeDark.themeData,
      home: BlocProvider(
        create: (context) => CalculatorCubit(),
        child: Scaffold(
          body: const CalculatorMtHome(),
        ),
      ),
    );
  }
}

class CalculatorMtHome extends StatelessWidget {
  const CalculatorMtHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: ResultView()),
            CalcButton(),
          ]),
    );
  }
}
