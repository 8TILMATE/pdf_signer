import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdf_signer/src/core/app_flow.dart';
import 'package:pdf_signer/src/core/size_config.dart';
import 'package:pdf_signer/src/features/doc_sign/widgets/doc_sign_floating_action_menu.dart';
import 'package:pdf_signer/src/features/home_page/screens/home_page.dart';
import 'package:pdf_signer/src/core/theme_config.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
//import 'package:pdfrx/pdfrx.dart';
class DocSignScreen extends StatelessWidget {
  const DocSignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: SfPdfViewer.file(File(globalVariables.pickedFileAsyncGlobal)),
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
              // Add your save action here
            },
          ),
        ],
      ),
      
      floatingActionButton: SigningOptions(),
    );
  }
}