import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdf_signer/src/features/home_page/providers/home_provider.dart';
import 'src/core/app_flow.dart';
import 'src/features/home_page/screens/home_page.dart';
import 'src/features/doc_sign/screen/doc_sign_screen.dart';
class AppView extends ConsumerWidget {
  //const Appview({super.key});
  const AppView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appFlowState = ref.watch(appFlowProvider);
    switch(appFlowState){
      case AppFlowState.homePage:
        return const HomePage();
      case AppFlowState.signDocument:
        return const DocSignScreen();
      case AppFlowState.exportFile:
        return const Scaffold(
          body: Center(child: Text('Export File Screen')),
        );
    }
  }
}