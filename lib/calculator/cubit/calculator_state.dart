part of 'calculator_cubit.dart';

@immutable
class CalculatorData extends Equatable {
  final Decimal value;
  final Decimal result;
  final List history;
  final CalcModes mode;
  final CalcOp? operation;

  CalculatorData({
    required this.value,
    Decimal? result,
    this.history = const [],
    this.mode = CalcModes.number,
    this.operation,
  }) : result = result ?? Decimal.zero;

  @override
  List<Object?> get props => [
        value,
        history,
        mode,
        result,
        operation,
      ];

  CalculatorData copyWith(
      {Decimal? value,
      List? history,
      Decimal? result,
      CalcModes? mode,
      CalcOp? operation}) {
    return CalculatorData(
      value: value ?? this.value,
      history: history ?? this.history,
      mode: mode ?? this.mode,
      result: result ?? this.result,
      operation: operation ?? this.operation,
    );
  }

  CalculatorData nullifyOp() {
    return CalculatorData(
      value: value,
      history: history,
      mode: mode,
      result: result,
      operation: null,
    );
  }
}

enum CalcModes {
  number,
  suhu,
  currency,
  panjang,
  berat,
}

enum CalcOp {
  Add,
  Subtract,
  Multiply,
  Divide,
  power,
  mod,
  root,
  erase,
  factorial,
}

extension CalcOpString on CalcOp {
  String toText() {
    switch (this) {
      case CalcOp.Add:
        return '+';
      case CalcOp.Subtract:
        return '-';
      case CalcOp.Multiply:
        return 'x';
      case CalcOp.Divide:
        return '/';

      default:
        return '';
    }
  }
}
