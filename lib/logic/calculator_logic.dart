class CalculationResult {
  final String result;
  final String operationLabel;

  const CalculationResult(this.result, this.operationLabel);
}

class CalculatorLogic {
  static CalculationResult calculate(
    String firstText,
    String secondText,
    String operation,
  ) {
    final first = double.tryParse(firstText.trim());
    final second = double.tryParse(secondText.trim());

    if (first == null ||
        second == null ||
        !first.isFinite ||
        !second.isFinite) {
      return const CalculationResult(
        'Invalid input',
        'Please enter two valid numbers',
      );
    }

    if (operation == '÷' && second == 0) {
      return const CalculationResult(
        'Cannot divide by zero',
        'Please change the second number',
      );
    }

    double answer;

    switch (operation) {
      case '+':
        answer = first + second;
        break;
      case '-':
        answer = first - second;
        break;
      case '×':
        answer = first * second;
        break;
      case '÷':
        answer = first / second;
        break;
      default:
        return const CalculationResult('Invalid operation', 'Unknown operator');
    }

    return CalculationResult(answer.toString(), '$first $operation $second');
  }
}
