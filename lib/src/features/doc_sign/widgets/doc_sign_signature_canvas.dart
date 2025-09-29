import 'package:flutter/material.dart';
import 'package:pdf_signer/src/features/doc_sign/services/doc_sign_drawer.dart';

class DocSignSignatureCanvas extends StatelessWidget {
  DocSignSignatureCanvas({super.key});
  final counter = ValueNotifier<int>(0);
  static List<Offset> currentDrawing = []; 
  void addPoint(Offset point){
    currentDrawing.add(point);
  }
  void destroyDrawing(){
    currentDrawing=[];
  }

  @override
  Widget build(context) {
    return Listener(
      onPointerDown: (event) {
        final box = context.findRenderObject() as RenderBox;
        final offset = box.globalToLocal(event.position);
        addPoint(offset);
        counter.value++;
      },
      onPointerMove: (event) {
        final box = context.findRenderObject() as RenderBox;
        final offset = box.globalToLocal(event.position);
        if(box.paintBounds.contains(offset))
        {
          addPoint(offset);
        }
       counter.value++;
      },
      onPointerUp: (event) {
              
      },
      child: RepaintBoundary(
        child: CustomPaint(
          painter: DocSignDrawer(counter),
          child: Container(),
        ),
      ),
    );
  }
}