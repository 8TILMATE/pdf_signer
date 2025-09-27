import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdf_signer/src/features/doc_sign/providers/doc_sign_widgets_provider.dart';
import 'package:pdf_signer/src/features/doc_sign/services/doc_sign_widgets_handler.dart';
import 'package:pdf_signer/src/features/doc_sign/widgets/doc_sign_movable_object.dart';

class DocSignCanvas extends ConsumerWidget {
  const DocSignCanvas({super.key});
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final widgetsUpdated = ref.watch(userAddedWidgetsProvider);
    return Stack(
      children: [
        ...DocSignWidgetsHandler.getCurrentWidgets()
      ],
    );
  }
}


