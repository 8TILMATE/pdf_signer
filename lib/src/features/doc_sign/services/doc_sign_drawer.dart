import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pdf_signer/src/features/doc_sign/widgets/doc_sign_signature_canvas.dart';

class DocSignDrawer extends CustomPainter{
  DocSignDrawer(Listenable repaint):super(repaint: repaint);
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    List<Offset> currentDrawing = DocSignSignatureCanvas.currentDrawing;
    path.moveTo(currentDrawing.first.dx, currentDrawing.first.dy);
    for(int i = 1; i < currentDrawing.length - 1; i++){
      path.quadraticBezierTo(currentDrawing[i].dx, currentDrawing[i].dy, (currentDrawing[i].dx + currentDrawing[i+1].dx) / 2, (currentDrawing[i].dy + currentDrawing[i+1].dy) / 2);
    }
    Paint paint = Paint()..color=Colors.black..strokeCap=StrokeCap.round..style=PaintingStyle.stroke..strokeWidth=2;
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}