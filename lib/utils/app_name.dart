import 'package:flutter/material.dart';
import 'package:news_app/blocs/theme_bloc.dart';
import 'package:provider/provider.dart';

class AppName extends StatelessWidget {
  final double fontSize;
  const AppName({Key? key, required this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    if (context.read<ThemeBloc>().darkTheme ?? false) {
      return Image.asset(
        "assets/images/logodisi.png",
        height: 54,
      );
    }
    return Image.asset(
      "assets/images/bulten360.png",
      height: 54,
    );
  }
}
