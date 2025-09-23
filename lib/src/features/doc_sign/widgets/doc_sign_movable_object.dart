import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdf_signer/src/features/doc_sign/models/doc_sign_pdf_info_model.dart';
import 'package:pdf_signer/src/features/doc_sign/providers/doc_sign_pdf_controller_provider.dart';

class DocSignMovableObject extends ConsumerWidget {
  DocSignMovableObject({super.key, required this.data});
  String data = "";

@override
  Widget build(BuildContext context, WidgetRef ref) {
    DocSignPdfInfoModel pdfInfo = ref.watch(scrolledPDFProvider);
    double scrollX= pdfInfo.scrollOffset?.dx??0;
    double scrollY = pdfInfo.scrollOffset?.dy??0;
    Size size = Size(pdfInfo.pageSize?.dx??0, pdfInfo.pageSize?.dy??0);
    size = new Size(0,0);
    double zoomFactor = pdfInfo.zoomFactor??0;
    double scaledX = size.width * zoomFactor;
    double scaledY = size.height * zoomFactor;
    double posX_inContent = scaledX;
    double posY_inContent = 1*size.height + scaledY;
    double finalX = posX_inContent - scrollX;
    double finalY = posY_inContent - scrollY;
    return Positioned(child: Transform.scale(child: const Text("Movable Object"),scale: zoomFactor,),left: finalX,top: finalY,);
  }
}