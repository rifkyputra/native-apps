import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_theme/system_theme.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart' as flutter_acrylic;

import '../cubit/calculator_cubit.dart';
import '../shared/parts.dart';

class CalculatorFluent extends StatelessWidget {
  const CalculatorFluent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalculatorCubit(),
      child: FluentApp(
        debugShowCheckedModeBanner: false,
        title: 'Calculator',
        home: Builder(builder: (context) {
          return FluentTheme(
            data: ThemeData(
              accentColor: SystemTheme.accentInstance.accent.toAccentColor(),
              scaffoldBackgroundColor: Colors.transparent,

              brightness: Brightness.dark,
              // acrylicBackgroundColor: Colors.magenta,
            ),
            child: ScaffoldPage(
              padding: EdgeInsets.zero,
              header: Container(
                height: 38,
                color: SystemTheme.accentInstance.accent.toAccentColor(),
                alignment: Alignment.topLeft,
                child: MoveWindow(
                  child: SizedBox(
                    height: 38,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Title'),
                        Spacer(),
                        Tooltip(
                          message: 'minimize',
                          child: MinimizeWindowButton(),
                        ),
                        Tooltip(
                          message: 'maximize',
                          child: MaximizeWindowButton(),
                        ),
                        Tooltip(
                          message: 'close',
                          child: CloseWindowButton(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              content: _Content(),
            ),
          );
        }),
      ),
    );
  }
}

class _Content extends StatefulWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      flutter_acrylic.Window.setEffect(
        effect: flutter_acrylic.WindowEffect.acrylic,
        color: FluentTheme.of(context).acrylicBackgroundColor.withOpacity(0.5),
        dark: true,
      );
      // setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: ResultView()),
        CalcButton(),
      ],
    );
  }
}
