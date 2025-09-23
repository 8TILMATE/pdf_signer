import 'dart:ui';
class DocSignPdfInfoModel {
  DocSignPdfInfoModel({required this.scrollOffset,required this.zoomFactor, required this.currentPage, required this.pageSize});
  Offset? scrollOffset;
  double? zoomFactor;
  int? currentPage;
  Offset? pageSize;
}