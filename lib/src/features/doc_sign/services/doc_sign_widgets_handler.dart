import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdf_signer/src/features/doc_sign/models/doc_sign_sketch.dart';
import 'package:pdf_signer/src/features/doc_sign/providers/doc_sign_painter_rebuilds.dart';
import 'package:pdf_signer/src/features/doc_sign/providers/doc_sign_widgets_provider.dart';
import 'package:pdf_signer/src/features/doc_sign/models/doc_sign_object.dart';
import 'package:pdf_signer/src/features/doc_sign/services/doc_sign_drawer.dart';
import 'package:pdf_signer/src/features/doc_sign/widgets/doc_sign_movable_object.dart';
import 'package:pdf_signer/src/features/doc_sign/widgets/doc_sign_signature_canvas.dart';
import 'package:pdf_signer/src/shared/bidirectionalmap.dart';
import 'package:uid/uid.dart';

class DocSignWidgetsHandler {
  static List<DocSignSketch> currentSketches = [];
  List<DocSignObject> userAddedWidgets = [];
  static Bidirectionalmap<String,DocSignObject> widgetMap =Bidirectionalmap();
  final erase = ValueNotifier<int>(0);
  static void addWidget(Offset position, String type, String data,WidgetRef ref){
    String uid = UId.getId(quantityOfRandomString: 4,isCapital: true);
    widgetMap.add(uid, DocSignObject(type, data, position));
    ref.read(userAddedWidgetsProvider.notifier).state= List.from(ref.read(userAddedWidgetsProvider.notifier).state)..add(uid);
  }
  static void updateWidgetPosition(String key, Offset position){
    widgetMap[key]?.position = position;
  }

  static List<Widget> getCurrentWidgets(){
    List<Widget> _getWidgets=[];
    for (var element in widgetMap.values()) {
      var obj = element as DocSignObject;
      _getWidgets.add(DocSignMovableObject(data: obj.data, posX: obj.position.dx, posY: obj.position.dy, Id: widgetMap.inverse(obj)!,objectType: obj.objectType,));
    }
    return _getWidgets;
  }
  static void addPoint(Offset point){
    currentSketches.last.currentDrawing.add(point);
  }
  static void destroyDrawing(DocSignSignatureCanvas owner){
    currentSketches = List.empty(growable: true);
    owner.repaintTrigger.value++;
  }
    static void destroyDrawing1(WidgetRef ref){
    currentSketches = List.empty(growable: true);
    ref.read(repaintsProvider.notifier).state=ref.read(repaintsProvider.notifier).state+1;
  }
  static void addSketch()
  {
    currentSketches.add(DocSignSketch());
  }
}