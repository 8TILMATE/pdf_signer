import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdf_signer/src/features/doc_sign/models/doc_sign_pdf_info_model.dart';
import 'package:pdf_signer/src/features/doc_sign/providers/doc_sign_pdf_controller_provider.dart';
import 'package:pdf_signer/src/features/doc_sign/services/doc_sign_add_text_to_pdf.dart';

class DocSignMovableObject extends ConsumerStatefulWidget{
  DocSignMovableObject({super.key, required this.data, required this.posX, required this.posY,required this.Id});
  String data = "";
  String Id = "";
  double posX=0,posY=0;
  ConsumerState<DocSignMovableObject> createState() => _DocSignMovableObjectState();
}
class _DocSignMovableObjectState extends ConsumerState<DocSignMovableObject>{
  DocSignAddTextToPdf _docSignAddTextToPdf = DocSignAddTextToPdf();
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
  Offset adjustedCoordinates = _docSignAddTextToPdf.adjustedCoordinates(pdfInfo,pdfX,pdfY);
  return Positioned(
    left: adjustedCoordinates.dx,top: adjustedCoordinates.dy,
    child: Transform.scale(
      scale: pdfInfo.zoomFactor!/2,
      alignment:Alignment.topLeft,
      child: LongPressDraggable(
        feedback: Transform.scale(
          scale: 1,
          alignment: Alignment.topLeft,
          child: Text(
            widget.data ,
            style: TextStyle(fontSize: 10*pdfInfo.zoomFactor!),
            ),
        ),
          onDragEnd: (details) =>         
          setState(() {
          Offset newCoords = _docSignAddTextToPdf.dragCoordinatesToPDFCoordinates(pdfInfo, details.offset.dx, details.offset.dy, context); 
          pdfY = newCoords.dy;
          pdfX = newCoords.dx;
          
          }),
    hapticFeedbackOnStart: true,
        child: Text(widget.data),) ),
    );
  }
}