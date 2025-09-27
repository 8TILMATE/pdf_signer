import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdf_signer/src/features/doc_sign/models/doc_sign_pdf_info_model.dart';
import 'package:pdf_signer/src/features/doc_sign/providers/doc_sign_pdf_controller_provider.dart';

class DocSignMovableObject extends ConsumerStatefulWidget{
  DocSignMovableObject({super.key, required this.data, required this.posX, required this.posY});
  String data = "";
  double posX=0,posY=0;
  ConsumerState<DocSignMovableObject> createState() => _DocSignMovableObjectState();
}
class _DocSignMovableObjectState extends ConsumerState<DocSignMovableObject>{
  double pdfX = 0;
  double pdfY = 0; 
  @override
  void initState() {
    super.initState();
    pdfX=widget.posX;
    pdfY=widget.posY;
    
  }
  @override
  Widget build(BuildContext context) {
    DocSignPdfInfoModel pdfInfo = ref.watch(scrolledPDFProvider);
  final scrollX = pdfInfo.scrollOffset?.dx ?? 0;
  final scrollY = pdfInfo.scrollOffset?.dy ?? 0;
  final zoomFactor = pdfInfo.zoomFactor ?? 1;
  final finalX = pdfX * zoomFactor - scrollX *zoomFactor;
  final finalY = pdfY * zoomFactor - scrollY * zoomFactor;
  return Positioned(
    left: finalX,top: finalY,
    child: Transform.scale(
      scale: zoomFactor/2,
      alignment:Alignment.topLeft,
      child: LongPressDraggable(
        feedback: Transform.scale(
          scale: 1,
          alignment: Alignment.topLeft,
          child: Text(
            widget.data ,
            style: TextStyle(fontSize: 10*zoomFactor),
            ),
        ),
          onDragEnd: (details) => 
          setState(() {
          pdfY = (details.offset.dy + scrollY * zoomFactor) / zoomFactor - (Scaffold.of(context).appBarMaxHeight ?? 0)/zoomFactor;
          pdfX = (details.offset.dx + scrollX * zoomFactor)/zoomFactor;
          }),
    hapticFeedbackOnStart: true,
        child: Text(widget.data),) ),
    );
  }
}