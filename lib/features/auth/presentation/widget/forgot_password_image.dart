import 'package:aklk_3ndna/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class ForgotPasswrodImage extends StatelessWidget {
  const ForgotPasswrodImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 235,
      width: 255,
      child: Image.asset(
        Assets.imagesSplashForgotPassword,
      ),
    );
  }
}
