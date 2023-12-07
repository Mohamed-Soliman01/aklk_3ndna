import 'package:aklk_3ndna/core/cubit/current_locale/current_locale_cubit.dart';
import 'package:aklk_3ndna/core/cubit/current_locale/current_locale_state.dart';
import 'package:aklk_3ndna/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String id = "homeView";
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentLocaleCubit, CurrentLocaleState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).signUp),
          ),
          body: GestureDetector(
            onTap: () {
              CurrentLocaleCubit.get(context).updateLanguage(value: true);
            },
            child: Center(child: Text('En')),
          ),
        );
      },
    );
  }
}
