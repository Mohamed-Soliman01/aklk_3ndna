import 'package:aklk_3ndna/core/utils/app_colors.dart';
import 'package:aklk_3ndna/features/auth/presentation/views/forgot_password_view.dart';
import 'package:flutter/material.dart';

class ForgotPasswordTextWidget extends StatelessWidget {
  const ForgotPasswordTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, ForgotPasswordView.id);
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          "Forgot Password ?",
          style: TextStyle(
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
