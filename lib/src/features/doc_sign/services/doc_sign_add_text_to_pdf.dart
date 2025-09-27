import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pdf_signer/src/features/doc_sign/models/doc_sign_pdf_info_model.dart';

class DocSignAddTextToPdf {

  Offset adjustedCoordinates(DocSignPdfInfoModel pdfInfo, double currentX,currentY){
  final scrollX = pdfInfo.scrollOffset?.dx ?? 0;
  final scrollY = pdfInfo.scrollOffset?.dy ?? 0;
  final zoomFactor = pdfInfo.zoomFactor ?? 1;
  final finalX = currentX * zoomFactor - scrollX *zoomFactor;
  final finalY = currentY * zoomFactor - scrollY * zoomFactor;
  return Offset(finalX,finalY);
  }
  Offset dragCoordinatesToPDFCoordinates(DocSignPdfInfoModel pdfInfo, double currentX, currentY, BuildContext context){
    final scrollX = pdfInfo.scrollOffset?.dx ?? 0;
    final scrollY = pdfInfo.scrollOffset?.dy ?? 0;
    final zoomFactor = pdfInfo.zoomFactor ?? 1;
    final finalY = (currentY + scrollY * zoomFactor) / zoomFactor - (Scaffold.of(context).appBarMaxHeight ?? 0)/zoomFactor;
    final finalX = (currentX + scrollX * zoomFactor)/zoomFactor;
    return Offset(finalX, finalY);
  }
  Offset pdfCoordinatesToNormalCoordinates(DocSignPdfInfoModel pdfInfo, double currentX, currentY){
    final scrollX = pdfInfo.scrollOffset?.dx ?? 0;
    final scrollY = pdfInfo.scrollOffset?.dy ?? 0;
    final zoomFactor = pdfInfo.zoomFactor ?? 1;
    final finalY = (currentY + scrollY*zoomFactor)/zoomFactor;
    final finalX = (currentX + scrollX * zoomFactor)/zoomFactor;
    return Offset(finalX, finalY);
  }

}