import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_block_app/src/features/blacklist/presentation/blacklist.dart';

class AddBlacklist extends ConsumerWidget {
  const AddBlacklist({super.key});

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const BlackList();
  }
}