import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pdf_signer/src/core/size_config.dart';
import 'package:pdf_signer/src/core/theme_config.dart';

class DocSignAddTextDialog {
  double dialogWidth = SizeConfig.screenWidth/1.05;
  double dialogHeight = SizeConfig.screenWidth/1.6;
  static String enteredText = '';
  WidgetBuilder dialogBoxText = (BuildContext context){
    return Dialog(
    shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(12.0)),
    child: Container(
      height: DocSignAddTextDialog().dialogHeight,
      width: DocSignAddTextDialog().dialogWidth,
      child: Padding(
        padding: EdgeInsetsGeometry.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Add Text", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                enteredText = value;
              },
              minLines: 1,
              maxLines: 2,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: const Color.fromARGB(255, 209, 208, 208), width: 0.3),
                  
                ),
                labelText: 'Enter your text here',
                labelStyle: TextStyle(fontSize: DocSignAddTextDialog().dialogHeight/18, color:Themeconfig().accentsColor.withAlpha(150)),
                
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                debugPrint("Text to be added: $enteredText");
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  
                ),
                minimumSize: Size(DocSignAddTextDialog().dialogWidth/1.08, 40),
              ),
              child: Text('Add Text'),
            ),
          ],
        )
      ) ,
    ),
  );
  };
  Future<dynamic> AddText(BuildContext context) {
    return showDialog(context: context, builder: dialogBoxText);
  }
}