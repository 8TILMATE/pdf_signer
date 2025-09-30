import 'package:flutter/material.dart';
import 'package:pdf_signer/src/features/doc_sign/models/doc_sign_sketch.dart';
import 'package:pdf_signer/src/features/doc_sign/services/doc_sign_drawer.dart';
import 'package:pdf_signer/src/features/doc_sign/services/doc_sign_widgets_handler.dart';

class DocSignSignatureCanvas extends StatelessWidget with ChangeNotifier {
  DocSignSignatureCanvas({super.key});
  final repaintTrigger = ValueNotifier<int>(0);
  @override
  Widget build(context) {
    return Listener(
      onPointerDown: (event) {
        final box = context.findRenderObject() as RenderBox;
        final offset = box.globalToLocal(event.position);
        DocSignWidgetsHandler.addSketch();
        DocSignWidgetsHandler.addPoint(offset);
        repaintTrigger.value++;
      },
      onPointerMove: (event) {
        final box = context.findRenderObject() as RenderBox;
        final offset = box.globalToLocal(event.position);
        if(box.paintBounds.contains(offset))
        {
          DocSignWidgetsHandler.addPoint(offset);
          repaintTrigger.value++;
        }
      },
      onPointerUp: (event) {
      },
      child: RepaintBoundary(
        child: CustomPaint(
          painter:DocSignDrawer(repaintTrigger),
          child: Container(),
        ),
      ),
    );
  }
}