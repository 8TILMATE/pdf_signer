import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdf_signer/src/features/home_page/services/home_page_file_acces.dart';
import 'package:pdf_signer/src/features/home_page/providers/home_provider.dart';

enum AppFlowState{
  homePage,
  signDocument,
  exportFile
}
class globalVariables {
 static String pickedFileAsyncGlobal = '';
}
final appFlowProvider = StateProvider<AppFlowState>((ref) {
  final pickedFileAsync = ref.watch(pickedFileProvider);
  globalVariables.pickedFileAsyncGlobal = pickedFileAsync ?? '';
  if (pickedFileAsync?.isEmpty == false) {
    return AppFlowState.signDocument;
  } else {
    return AppFlowState.homePage;
  }
});


