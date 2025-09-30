import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdf_signer/src/features/doc_sign/models/doc_sign_pdf_info_model.dart';
int repaints=0;
final repaintsProvider = StateProvider<int>((ref) => repaints);

