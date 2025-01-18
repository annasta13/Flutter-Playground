import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  final String message;
  final Function()? onRetry;

  const EmptyView({required this.message, this.onRetry, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.error, color: Colors.red),
        const SizedBox(height: 8),
        Text(message),
        if (onRetry != null)
          ElevatedButton(onPressed: onRetry!, child: const Text("Retry")),
      ],
    ));
  }
}
