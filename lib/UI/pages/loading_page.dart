import 'package:flutter/material.dart';
import 'package:intern/theme_page/constants.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MyLoading extends StatelessWidget {
  const MyLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: LoadingAnimationWidget.horizontalRotatingDots(
          color: AppColors.primary,
          size: 100,
        ),
      ),
    ));
  }
}
