import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jakarta_suite/calculator/cubit/calculator_cubit.dart';

class ResultView extends StatelessWidget {
  const ResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomRight,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
        ),
        margin: const EdgeInsets.only(bottom: 23),
        child: BlocBuilder<CalculatorCubit, CalculatorData>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      state.result.toString(),
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      state.operation?.toText() ?? '',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      state.value.toString(),
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}

class CalcButton extends StatelessWidget {
  const CalcButton({Key? key}) : super(key: key);
  static const maxSizeBtn = 100;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        child: StaggeredGrid.count(
          crossAxisCount: 5,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          children: [
            PadButton(
              onTap: () => context.read<CalculatorCubit>().delete(),
              text: "C",
              color: Colors.red,
            ),
            PadButton(
              onTap: () => context.read<CalculatorCubit>().power(),
              text: "pow",
            ),
            PadButton(
              onTap: () => context.read<CalculatorCubit>().multiply(),
              text: "x",
            ),
            PadButton(
              onTap: () => context.read<CalculatorCubit>().erase(),
              text: "AC",
              x: 2,
            ),
            PadButton(
              onTap: () => context.read<CalculatorCubit>().editVal(7),
              text: "7",
            ),
            PadButton(
              onTap: () => context.read<CalculatorCubit>().editVal(8),
              text: "8",
            ),
            PadButton(
              onTap: () => context.read<CalculatorCubit>().editVal(9),
              text: "9",
            ),
            PadButton(
              onTap: () => context.read<CalculatorCubit>().subtract(),
              text: "-",
            ),
            PadButton(
              onTap: () => context.read<CalculatorCubit>().multiply(),
              text: "x",
            ),
            PadButton(
              onTap: () => context.read<CalculatorCubit>().editVal(4),
              text: "4",
            ),
            PadButton(
              onTap: () => context.read<CalculatorCubit>().editVal(5),
              text: "5",
            ),
            PadButton(
              onTap: () => context.read<CalculatorCubit>().editVal(6),
              text: "6",
            ),
            PadButton(
              onTap: () => context.read<CalculatorCubit>().add(),
              text: "+",
            ),
            PadButton(
              onTap: () => context.read<CalculatorCubit>().divide(),
              text: "/",
            ),
            PadButton(
              onTap: () => context.read<CalculatorCubit>().editVal(1),
              text: "1",
            ),
            PadButton(
              onTap: () => context.read<CalculatorCubit>().editVal(2),
              text: "2",
            ),
            PadButton(
              onTap: () => context.read<CalculatorCubit>().editVal(3),
              text: "3",
            ),
            PadButton(
              onTap: () => context.read<CalculatorCubit>().mod(),
              text: "mod",
            ),
            PadButton(
              onTap: () => context.read<CalculatorCubit>().result(),
              text: "=",
              color: Theme.of(context).colorScheme.error,
              y: 2,
            ),
            PadButton(
              onTap: () => context.read<CalculatorCubit>().squareRoot(),
              text: "sqrt",
            ),
            PadButton(
              onTap: () => context.read<CalculatorCubit>().editVal(0),
              text: "0",
            ),
            PadButton(
              onTap: () => context.read<CalculatorCubit>()
                ..editVal(0)
                ..editVal(0),
              text: "00",
            ),
            PadButton(
              onTap: () => context.read<CalculatorCubit>().factorial(),
              text: "!",
            ),
          ],
        ),
      ),
    );
  }
}

class PadButton extends StatelessWidget {
  const PadButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.color,
    this.x = 1,
    this.y = 1,
  }) : super(key: key);

  final void Function() onTap;
  final String text;
  final Color? color;
  final int y;
  final int x;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridTile.count(
      crossAxisCellCount: x,
      mainAxisCellCount: y,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 110),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: color ?? Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Center(
              child: Text(text),
            ),
          ),
        ),
      ),
    );
  }
}
