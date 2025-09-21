import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdf_signer/app_view.dart';
import 'src/core/size_config.dart';
import '/src/features/home_page/screens/home_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      title: 'SignNow',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.

        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: SizeConfig.screenWidth/20, fontFamily: "Roboto", color: Colors.black),
          bodyMedium: TextStyle(fontSize: SizeConfig.screenWidth/25, fontFamily: "Roboto", color: Colors.black),
          bodySmall: TextStyle(fontSize: SizeConfig.screenWidth/30, fontFamily: "Roboto", color: Colors.black),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ProviderScope(child: const AppView()),
    );
  }
}