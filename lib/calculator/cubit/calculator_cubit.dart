import 'package:bloc/bloc.dart';
import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'dart:math';

part 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorData> {
  CalculatorCubit() : super(CalculatorData(value: Decimal.fromInt(0)));

  void editVal(int input) => emit(state.copyWith(
      value: Decimal.fromJson('${state.value.toString()}$input')));

  void _calculate(Decimal input) {
    switch (state.operation) {
      case CalcOp.Add:
        final result = state.result + input;

        emit(
          state.copyWith(result: result, value: Decimal.zero),
        );
        break;
      case CalcOp.Subtract:
        final result = state.result - input;
        emit(
          state.copyWith(result: result, value: Decimal.zero),
        );
        break;
      case CalcOp.Multiply:
        final result = state.result * input;
        emit(
          state.copyWith(result: result, value: Decimal.zero),
        );
        break;
      case CalcOp.Divide:
        final result = Decimal.fromBigInt(state.result ~/ input);

        emit(
          state.copyWith(result: result, value: Decimal.zero),
        );
        break;
      case CalcOp.mod:
        final result = state.result.remainder(input);

        emit(
          state.copyWith(result: result, value: Decimal.zero),
        );
        break;
      case CalcOp.root:
        final result =
            Decimal.fromInt(sqrt(state.result.toBigInt().toInt()).toInt());

        emit(
          state.copyWith(result: result, value: Decimal.zero),
        );
        break;
      case CalcOp.power:
        final result = state.result == Decimal.zero
            ? state.value.pow(2)
            : state.result.pow(2);

        emit(
          state.copyWith(result: result, value: Decimal.zero),
        );
        break;

      case CalcOp.factorial:
        BigInt result = BigInt.one;
        for (int x = state.value.toBigInt().toInt(); x > 0; x--) {
          result = result * BigInt.from(x);
        }

        emit(
          state.copyWith(
              result: Decimal.fromBigInt(result), value: Decimal.zero),
        );
        break;
      default:
      //
    }
    emit(state.nullifyOp());
  }

  void _calculateOrZero() {
    if (state.result != Decimal.zero) {
      _calculate(state.value);
    } else {
      emit(state.copyWith(
        value: Decimal.zero,
        result: state.result == Decimal.zero ? state.value : state.result,
      ));
    }
  }

  void _appendOperand(CalcOp operand) {
    emit(
      state.copyWith(
        operation: operand,
      ),
    );
  }

  void erase() {
    emit(state.copyWith(result: Decimal.zero, value: Decimal.zero));
    emit(state.nullifyOp());
  }

  void delete() {
    final value = state.value.toString();
    if (value.length <= 1) {
      emit(state.copyWith(value: Decimal.zero));
    } else {
      emit(state.copyWith(
          value: Decimal.fromJson(value.substring(0, value.length - 1))));
    }
  }

  void result() {
    if (state.operation != null) {
      _calculate(state.value);
    }
  }

  void add() {
    _appendOperand(CalcOp.Add);
    _calculateOrZero();
  }

  void multiply() {
    _appendOperand(CalcOp.Multiply);
    _calculateOrZero();
  }

  void divide() {
    _appendOperand(CalcOp.Divide);
    _calculateOrZero();
  }

  void subtract() {
    _appendOperand(CalcOp.Subtract);
    _calculateOrZero();
  }

  void power() {
    _appendOperand(CalcOp.power);
    _calculate(state.value);
  }

  void mod() {
    _appendOperand(CalcOp.mod);
    _calculate(state.value);
  }

  void squareRoot() {
    _appendOperand(CalcOp.root);
    _calculate(state.value);
  }

  void factorial() {
    _appendOperand(CalcOp.factorial);
    _calculate(state.value);
  }
}
