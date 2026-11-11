import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class ResultDisplay extends StatelessWidget {
  final String operationLabel;
  final String result;

  const ResultDisplay({
    super.key,
    required this.operationLabel,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.indigo.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppConstants.primaryColor),
      ),
      child: Column(
        children: [
          Text(operationLabel, textAlign: TextAlign.center),
          const SizedBox(height: 12),
          const Text('RESULT', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(
            result,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppConstants.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
