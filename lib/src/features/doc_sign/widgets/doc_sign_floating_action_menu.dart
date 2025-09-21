import 'package:flutter/material.dart';
import 'package:pdf_signer/src/core/size_config.dart';

class SigningOptions extends StatefulWidget {
  const SigningOptions({super.key});

  @override
  State<SigningOptions> createState() => _SigningOptionsState();
}

class _SigningOptionsState extends State<SigningOptions>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progress;
  double widgetSize = SizeConfig.screenWidth / 6;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _progress = Tween<double>(begin:0, end:1).animate(_controller);  
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onOpened: () => _controller.forward(),
      onCanceled: () => _controller.reverse(),
      onSelected: (value) => _controller.reverse(),
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 1,
          child: Text('Add Signature'),
        ),
        const PopupMenuItem(
          value: 2,
          child: Text('Add Date'),
        ),
        const PopupMenuItem(
          value: 3,
          child: Text('Add Text'),
        ),
      ],
      icon: Container(
        height: widgetSize,
        width: widgetSize,
        child:  Center(child: AnimatedIcon(icon: AnimatedIcons.menu_close, progress:_progress, size: widgetSize/2, color: Colors.white,)),
        decoration: BoxDecoration(
          color: Colors.purple[200],
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      offset: const Offset(0,  - 175),
    );
  }
}