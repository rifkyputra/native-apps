import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jakarta_suite/calculator/cubit/calculator_cubit.dart';

import '../shared/parts.dart';

class CalculatorMt extends StatelessWidget {
  const CalculatorMt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    return SingleChildScrollView(
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ResultView(),
            CalcButton(),
          ]),
    );
  }
}
