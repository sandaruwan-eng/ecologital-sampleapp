import 'package:flutter/material.dart';
import 'package:sampleapp/style_guide/colors.dart';
import 'package:sampleapp/widget/widget.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backGroundColor,
      body: SingleChildScrollView(child: HomeScreen()),
    );
  }
}
