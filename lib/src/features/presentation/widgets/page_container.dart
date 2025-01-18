import 'package:flutter/material.dart';
import 'package:playground/src/features/presentation/widgets/empty_view.dart';

class PageContainer<T> extends StatelessWidget {
  final bool loading;

  final String? errorMessage;

  final T? successState;

  final Function()? onRetry;

  final Widget Function(T) child;

  const PageContainer(
      {required this.loading,
      this.errorMessage,
      this.successState,
      this.onRetry,
      required this.child,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Movie List")),
        body: Builder(builder: (context) {
          if (loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (errorMessage != null) {
            return EmptyView(
                message: errorMessage ?? "Data not found", onRetry: onRetry);
          } else if (successState != null) {
            return child(successState as T);
          } else {
            return const EmptyView(message: "Data not found", onRetry: null);
          }
        }));
  }
}
