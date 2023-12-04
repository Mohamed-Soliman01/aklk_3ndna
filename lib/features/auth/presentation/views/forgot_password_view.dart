import 'package:flutter/material.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});
  static const id = 'forgotPassword';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverToBoxAdapter(child: SizedBox(height: 108)),
          // SliverToBoxAdapter(
          //     child: WelcomeTextWidget(text: AppStrings.forgotPassword)),
          // SliverToBoxAdapter(child: SizedBox(height: 40)),
          // SliverToBoxAdapter(child: ForgotPasswrodImage()),
          // SliverToBoxAdapter(child: SizedBox(height: 24)),
          // SliverToBoxAdapter(child: ForgotPasswordSubTitle()),
          // SliverToBoxAdapter(child: CustomForgotPasswrodForm()),
        ],
      ),
    );
  }
}
