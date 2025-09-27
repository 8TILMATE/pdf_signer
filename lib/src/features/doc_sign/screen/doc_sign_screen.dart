import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdf_signer/src/core/app_flow.dart';
import 'package:pdf_signer/src/core/size_config.dart';
import 'package:pdf_signer/src/features/doc_sign/models/doc_sign_pdf_info_model.dart';
import 'package:pdf_signer/src/features/doc_sign/providers/doc_sign_pdf_controller_provider.dart';
import 'package:pdf_signer/src/features/doc_sign/widgets/doc_sign_canvas.dart';
import 'package:pdf_signer/src/features/doc_sign/widgets/doc_sign_floating_action_menu.dart';
import 'package:pdf_signer/src/features/doc_sign/widgets/doc_sign_movable_object.dart';
import 'package:pdf_signer/src/features/home_page/screens/home_page.dart';
import 'package:pdf_signer/src/core/theme_config.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

//import 'package:pdfrx/pdfrx.dart';
class DocSignScreen extends ConsumerWidget {
  final PdfViewerController pdfViewerController = PdfViewerController();
  bool isReady = false;
  Offset pageSize = Offset(0,0);
  DocSignScreen({super.key});
 /* List<DocSignMovableObject> addedObjects = [             
             DocSignMovableObject(data: "TestWidget1",posX: 200,posY: 100,),
             DocSignMovableObject(data: "TestWidget2",posX: 300,posY: 200,),
             DocSignMovableObject(data: "TestWidget3",posX: 400,posY: 100,),
             DocSignMovableObject(data: "TestWidget4",posX: 200,posY: 300,),
             DocSignMovableObject(data: "TestWidget5",posX: 200,posY: 400,),
             DocSignMovableObject(data: "TestWidget6",posX: 200,posY: 500,),
             DocSignMovableObject(data: "TestWidget7",posX: 200,posY: 600,),
            ];
            */
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Scaffold(
      body: Center(
        child: Stack(
          children: [
            SfPdfViewer.file(File(globalVariables.pickedFileAsyncGlobal),controller: pdfViewerController..addListener(()=>updateOffset(ref)),onDocumentLoaded: (details) =>{ isReady=true, pageSize= getPageSize()}),
            DocSignCanvas()
             ],)
      ),

      appBar: AppBar(
        title: Text("Document Signer",style: TextStyle(fontFamily: "Roboto", letterSpacing: .25, fontWeight: FontWeight.w500, color: Colors.white),),
        backgroundColor: Themeconfig().primaryColor,
        centerTitle: true,
        
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Themeconfig().primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Icon(Icons.archive_outlined, color: Colors.white),
            onPressed: () {
              print(pdfViewerController.scrollOffset.dy.toString()+"offset y, zoom level: "+pdfViewerController.zoomLevel.toString());
            },
          ),
        ],
      ),
      
      floatingActionButton: SigningOptions(ref: ref),
    );
  }

  updateOffset(WidgetRef ref){
    if (!isReady) return;
    ref.read(scrolledPDFProvider.notifier).state = DocSignPdfInfoModel(
      scrollOffset: pdfViewerController.scrollOffset,
      zoomFactor: pdfViewerController.zoomLevel,
      currentPage: pdfViewerController.pageNumber,
      pageSize: pageSize,
    );
  }
  Offset getPageSize(){
    return Offset(275/3, 450);
  }
}