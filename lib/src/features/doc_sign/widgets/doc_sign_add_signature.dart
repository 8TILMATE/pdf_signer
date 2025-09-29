import 'package:flutter/material.dart';
import 'package:pdf_signer/src/core/size_config.dart';
import 'package:pdf_signer/src/core/theme_config.dart';
import 'package:pdf_signer/src/features/doc_sign/widgets/doc_sign_canvas.dart';
import 'package:pdf_signer/src/features/doc_sign/widgets/doc_sign_signature_canvas.dart';

class DocSignAddSignature {
  double dialogWidth = SizeConfig.screenWidth/1.02;
  double dialogHeight = SizeConfig.screenWidth/1.4;
  final WidgetBuilder _dialogBoxSignature =(BuildContext context){
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12)),
      child: Container(
        height: DocSignAddSignature().dialogHeight,
        width: DocSignAddSignature().dialogWidth,
        child: Padding(
          padding: EdgeInsetsGeometry.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Add your signature",style: TextStyle(color: Themeconfig().primaryColor),),
              Card.outlined(
                shadowColor: Themeconfig().secondaryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),side: BorderSide(width: 1, color: Themeconfig().accentsColor)),
                child: Container(
                  height: DocSignAddSignature().dialogHeight/1.7,
                  width:  DocSignAddSignature().dialogWidth/1.08,
                  child: DocSignSignatureCanvas(),
                ),
                
                
              ),
              ElevatedButton(onPressed: (){}, child: Text("Add"))
            ],
          ),
        )
      ),
    );
  };
    Future<dynamic> AddSignature(BuildContext context) {
    return showDialog(context: context, builder: _dialogBoxSignature);
  }
}