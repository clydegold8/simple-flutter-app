import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_block_app/src/features/first_time_usage/presentation/first_time_usage_widget.dart';

class FirstTimeUsage extends ConsumerWidget {
  const FirstTimeUsage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return firstTimeUserWidget(context, ref);
  }
}
