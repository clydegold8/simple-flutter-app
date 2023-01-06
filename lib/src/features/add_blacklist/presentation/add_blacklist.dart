import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_block_app/src/features/blacklist/presentation/blacklist.dart';

class AddBlacklist extends ConsumerWidget {
  const AddBlacklist({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const BlackList();
  }
}