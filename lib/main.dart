import 'package:exploden_kittens/constants/colors.dart';
import 'package:exploden_kittens/pages/init.dart';
import 'package:exploden_kittens/pages/main.dart';
import 'package:exploden_kittens/router/routes.dart';
import 'package:exploden_kittens/tools/material_state_resolver.dart';
import 'package:flutter/material.dart';

void main() {
  CustomRouter.registerRoute(CustomRouter.init, (context) => InitialPage());
  CustomRouter.registerRoute(CustomRouter.main, (context) => const MainMenu());
  runApp(const ExplodenKittens());
}

class ExplodenKittens extends StatelessWidget {
  const ExplodenKittens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stealed Exploding Kittens',
      theme: ThemeData(
          canvasColor: colorBackgroundWhite,
          appBarTheme: AppBarTheme(
              centerTitle: false,
              backgroundColor: colorBackgroundRed,
              foregroundColor: colorTextWhite,
              toolbarTextStyle: TextStyle(
                  color: colorTextWhite, fontFamily: "BebasNeue-Cyrillic")),
          textTheme: TextTheme(
              bodyMedium: TextStyle(
                  color: colorTextBlack,
                  fontFamily: "BebasNeue-Cyrillic",
                  fontWeight: FontWeight.normal)),
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.all(16.0)),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>((state) =>
                      materialStateColorResolve(colorBackgroundBlack, state)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(colorTextWhite),
                  overlayColor:
                      MaterialStateProperty.all<Color>(colorBackgroundBlack),
                  textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
                      fontFamily: "BebasNeue-Cyrillic",
                      fontWeight: FontWeight.normal,
                      fontSize: 24)))),
          textButtonTheme:
              TextButtonThemeData(style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(colorTextWhite)))),
      initialRoute: CustomRouter.init,
      onGenerateRoute: CustomRouter.onGenerateRoute,
    );
  }
}
