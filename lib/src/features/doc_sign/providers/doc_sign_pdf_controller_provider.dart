import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdf_signer/src/features/doc_sign/models/doc_sign_pdf_info_model.dart';
DocSignPdfInfoModel model = DocSignPdfInfoModel(zoomFactor: 0,scrollOffset: Offset(0, 0),currentPage: 1,pageSize: Offset(500, 500));
final scrolledPDFProvider = StateProvider<DocSignPdfInfoModel>((ref) => model);
