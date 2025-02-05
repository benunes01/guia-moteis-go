import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste/app/core/theme/theme_colors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
      title: 'Guia de Motéis',
      theme: ThemeData(primaryColor: ThemeColors.kPrimary),
      routerConfig: Modular.routerConfig,
    );
  }
}