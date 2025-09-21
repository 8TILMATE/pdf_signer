import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdf_signer/src/core/size_config.dart';
import 'package:pdf_signer/src/core/theme_config.dart';
import 'package:pdf_signer/src/features/home_page/animation/home_page_text_animation.dart';
import 'package:pdf_signer/src/features/home_page/services/home_page_file_acces.dart';
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final fileWatcher = ref.watch(pickedFileProvider);
    return Scaffold(
      body: Stack(
        children: [
        GlidingText(),
        Center(
          child: 
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Welcome to SignNow!", style: TextStyle(fontSize: SizeConfig.isPhone? SizeConfig.screenWidth/12 : SizeConfig.screenWidth/15, fontFamily: "Arial", fontWeight: FontWeight.bold,color: Themeconfig().primaryColor,),),
                  SizedBox(height: SizeConfig.screenHeight/20),
                  ElevatedButton(
                    onPressed: ()
                    {
                      FileManager().pickFile(ref);
                    }, 
                    child: Text("Get Started!"), 
                    style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(7)), minimumSize: Size(SizeConfig.screenWidth/1.5, SizeConfig.screenHeight/12))),
                ],
              ),
          ),]
      ),

      );  
  }
}