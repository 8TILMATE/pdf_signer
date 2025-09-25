import 'package:flutter/material.dart';
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
  double pdfX = 0; // replace with your widget's PDF X
  double pdfY = 0; // replace with your widget's PDF Y
  @override
  Widget build(BuildContext context) {
    DocSignPdfInfoModel pdfInfo = ref.watch(scrolledPDFProvider);
    initState(){
      pdfX=widget.posX;
      pdfY=widget.posY;
    }
      // Your annotation's position in PDF coordinates
    /*
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
    */
  final scrollX = pdfInfo.scrollOffset?.dx ?? 0;
  final scrollY = pdfInfo.scrollOffset?.dy ?? 0;
  final zoomFactor = pdfInfo.zoomFactor ?? 1;



  // Calculate screen position based on PDF coords, zoom, and scroll
  final finalX = pdfX * zoomFactor - scrollX *zoomFactor;
  final finalY = pdfY * zoomFactor - scrollY * zoomFactor;
    return Positioned(child: Transform.scale(child: LongPressDraggable(child: const Text("Movable Object"),feedback: const Text("Movable Object"),onDragEnd: (details) => setState(() {
      pdfY=details.offset.dy - scrollY*zoomFactor;
      pdfX=details.offset.dx - scrollX*zoomFactor;
    }),hapticFeedbackOnStart: true,),scale: zoomFactor/2,alignment:Alignment.topLeft ),left: finalX,top: finalY,);
  }
}