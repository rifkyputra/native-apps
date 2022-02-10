import 'package:adwaita/adwaita.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jakarta_suite/calculator/cubit/calculator_cubit.dart';
import 'package:libadwaita/libadwaita.dart';

class CalculatorAdw extends StatelessWidget {
  const CalculatorAdw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AdwaitaThemeData.dark(),
      darkTheme: AdwaitaThemeData.dark(),
      home: BlocProvider(
        create: (context) => CalculatorCubit(),
        child: AdwScaffold(
          body: const CalculatorAdwHome(),
        ),
      ),
    );
  }
}

class CalculatorAdwHome extends StatelessWidget {
  const CalculatorAdwHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AdwHeaderBar(
                windowDecor: (_, __, ___) => const AdwHeaderBar.minimal()),
            ResultView(),
            CalcButton(),
          ]),
    );
  }
}

class ResultView extends StatelessWidget {
  const ResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomRight,
        decoration: BoxDecoration(
          color: Colors.grey,
        ),
        child: BlocBuilder<CalculatorCubit, CalculatorData>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(state.result.toString(),
                      style: Theme.of(context).textTheme.displaySmall),
                  const SizedBox(height: 10),
                  Text(state.operation?.toText() ?? '',
                      style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 10),
                  Text(state.value.toString(),
                      style: Theme.of(context).textTheme.displaySmall),
                ],
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
            _SingleButton(
              onTap: () => context.read<CalculatorCubit>().delete(),
              text: "C",
              color: Colors.red,
            ),
            _SingleButton(
              onTap: () => context.read<CalculatorCubit>().power(),
              text: "pow",
            ),
            _SingleButton(
              onTap: () => context.read<CalculatorCubit>().multiply(),
              text: "x",
            ),
            _SingleButton(
              onTap: () => context.read<CalculatorCubit>().erase(),
              text: "AC",
              x: 2,
            ),
            _SingleButton(
              onTap: () => context.read<CalculatorCubit>().editVal(7),
              text: "7",
            ),
            _SingleButton(
              onTap: () => context.read<CalculatorCubit>().editVal(8),
              text: "8",
            ),
            _SingleButton(
              onTap: () => context.read<CalculatorCubit>().editVal(9),
              text: "9",
            ),
            _SingleButton(
              onTap: () => context.read<CalculatorCubit>().subtract(),
              text: "-",
            ),
            _SingleButton(
              onTap: () => context.read<CalculatorCubit>().multiply(),
              text: "x",
            ),
            _SingleButton(
              onTap: () => context.read<CalculatorCubit>().editVal(4),
              text: "4",
            ),
            _SingleButton(
              onTap: () => context.read<CalculatorCubit>().editVal(5),
              text: "5",
            ),
            _SingleButton(
              onTap: () => context.read<CalculatorCubit>().editVal(6),
              text: "6",
            ),
            _SingleButton(
              onTap: () => context.read<CalculatorCubit>().add(),
              text: "+",
            ),
            _SingleButton(
              onTap: () => context.read<CalculatorCubit>().divide(),
              text: "/",
            ),
            _SingleButton(
              onTap: () => context.read<CalculatorCubit>().editVal(1),
              text: "1",
            ),
            _SingleButton(
              onTap: () => context.read<CalculatorCubit>().editVal(2),
              text: "2",
            ),
            _SingleButton(
              onTap: () => context.read<CalculatorCubit>().editVal(3),
              text: "3",
            ),
            _SingleButton(
              onTap: () => context.read<CalculatorCubit>().mod(),
              text: "mod",
            ),
            _SingleButton(
              onTap: () => context.read<CalculatorCubit>().result(),
              text: "=",
              color: Colors.green,
              y: 2,
            ),
            _SingleButton(
              onTap: () => context.read<CalculatorCubit>().squareRoot(),
              text: "sqrt",
            ),
            _SingleButton(
              onTap: () => context.read<CalculatorCubit>().editVal(0),
              text: "0",
            ),
            _SingleButton(
              onTap: () => context.read<CalculatorCubit>()
                ..editVal(0)
                ..editVal(0),
              text: "00",
            ),
            _SingleButton(
              onTap: () => context.read<CalculatorCubit>().factorial(),
              text: "!",
            ),
          ],
        ),
      ),
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        row1(),
        row2(),
        row3(),
        row4(),
      ],
    );
  }

  Row row1() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {},
          child: const AdwClamp(
            center: true,
            maximumSize: 100,
            child: Text('7'),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: const AdwClamp(
            center: true,
            maximumSize: 100,
            child: Text('8'),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: const AdwClamp(
            center: true,
            maximumSize: 100,
            child: Text('9'),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: const AdwClamp(
            center: true,
            maximumSize: 100,
            child: Text('+'),
          ),
        ),
      ],
    );
  }

  Row row2() {
    return Row(children: [
      GestureDetector(
        onTap: () {},
        child: const AdwClamp(
          center: true,
          maximumSize: 100,
          child: Text('4'),
        ),
      ),
      GestureDetector(
        onTap: () {},
        child: const AdwClamp(
          center: true,
          maximumSize: 100,
          child: Text('5'),
        ),
      ),
      GestureDetector(
        onTap: () {},
        child: const AdwClamp(
          center: true,
          maximumSize: 100,
          child: Text('6'),
        ),
      ),
      GestureDetector(
        onTap: () {},
        child: const AdwClamp(
          center: true,
          maximumSize: 100,
          child: Text('-'),
        ),
      ),
    ]);
  }

  Row row3() {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      GestureDetector(
        onTap: () {},
        child: const AdwClamp(
          center: true,
          maximumSize: 100,
          child: Text('1'),
        ),
      ),
      GestureDetector(
        onTap: () {},
        child: const AdwClamp(
          center: true,
          maximumSize: 100,
          child: Text('2'),
        ),
      ),
      GestureDetector(
        onTap: () {},
        child: const AdwClamp(
          center: true,
          maximumSize: 100,
          child: Text('3'),
        ),
      ),
      GestureDetector(
        onTap: () {},
        child: const AdwClamp(
          center: true,
          maximumSize: 100,
          child: Text('x'),
        ),
      ),
    ]);
  }

  Row row4() {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      GestureDetector(
        onTap: () {},
        child: const AdwClamp(
          center: true,
          maximumSize: 100,
          child: Text(','),
        ),
      ),
      GestureDetector(
        onTap: () {},
        child: const AdwClamp(
          center: true,
          maximumSize: 100,
          child: Text('0'),
        ),
      ),
      GestureDetector(
        onTap: () {},
        child: const AdwClamp(
          center: true,
          maximumSize: 100,
          child: Text('00'),
        ),
      ),
      GestureDetector(
        onTap: () {},
        child: const AdwClamp(
          center: true,
          maximumSize: 100,
          child: Text('/'),
        ),
      ),
    ]);
  }
}

class _SingleButton extends StatelessWidget {
  const _SingleButton({
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
              color: color?.withAlpha(25) ?? AdwaitaColors.button,
              // boxShadow: kElevationToShadow[],
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

class _EmptyButton extends StatelessWidget {
  const _EmptyButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 110),
      child: Container(
        decoration: BoxDecoration(
          // boxShadow: kElevationToShadow[],
          borderRadius: BorderRadius.circular(22),
        ),
        child: SizedBox(),
      ),
    );
  }
}
