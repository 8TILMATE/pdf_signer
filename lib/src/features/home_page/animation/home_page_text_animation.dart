import 'package:flutter/material.dart';

class GlidingText extends StatefulWidget {
  const GlidingText({super.key});

  @override
  State<GlidingText> createState() => GlidingTextState();
}

class GlidingTextState extends State<GlidingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this)..repeat(period: Duration(seconds: 20));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
     String text = "Welcome to SignNow!"*30;

  @override
  Widget build(BuildContext context) {
    return  SlideTransition(child: RotationTransition(child: Text(text), turns: AlwaysStoppedAnimation(120/160),), position: Tween<Offset>(begin: Offset(1,-1), end: Offset(-1,2)).animate(_controller));
  }
}