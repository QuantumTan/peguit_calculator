import 'package:flutter/material.dart';

class OperationButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const OperationButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label, style: const TextStyle(fontSize: 24)),
    );
  }
}
