import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../logic/calculator_logic.dart';
import '../widgets/number_input_field.dart';
import '../widgets/operation_button.dart';
import '../widgets/result_display.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final firstNumberController = TextEditingController();
  final secondNumberController = TextEditingController();

  String result = AppConstants.defaultResult;
  String operationLabel = AppConstants.defaultLabel;

  void calculate(String operation) {
    final output = CalculatorLogic.calculate(
      firstNumberController.text,
      secondNumberController.text,
      operation,
    );

    setState(() {
      result = output.result;
      operationLabel = output.operationLabel;
    });
  }

  void clearCalculator() {
    firstNumberController.clear();
    secondNumberController.clear();

    setState(() {
      result = AppConstants.defaultResult;
      operationLabel = AppConstants.defaultLabel;
    });
  }

  @override
  void dispose() {
    firstNumberController.dispose();
    secondNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appBarTitle),
        centerTitle: true,
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.calculate,
              size: 64,
              color: AppConstants.primaryColor,
            ),
            const SizedBox(height: 12),
            const Text(
              'BASIC CALCULATOR',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            NumberInputField(
              controller: firstNumberController,
              label: 'First Number',
              hint: 'Enter the first number',
              icon: Icons.looks_one,
            ),
            const SizedBox(height: 16),
            NumberInputField(
              controller: secondNumberController,
              label: 'Second Number',
              hint: 'Enter the second number',
              icon: Icons.looks_two,
            ),
            const SizedBox(height: 24),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 12,
              runSpacing: 12,
              children: [
                OperationButton(label: '+', onPressed: () => calculate('+')),
                OperationButton(label: '−', onPressed: () => calculate('-')),
                OperationButton(label: '×', onPressed: () => calculate('×')),
                OperationButton(label: '÷', onPressed: () => calculate('÷')),
              ],
            ),
            const SizedBox(height: 24),
            ResultDisplay(operationLabel: operationLabel, result: result),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: clearCalculator,
              icon: const Icon(Icons.refresh),
              label: const Text('Clear'),
            ),
            const SizedBox(height: 24),
            const Text(AppConstants.creatorInfo, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
