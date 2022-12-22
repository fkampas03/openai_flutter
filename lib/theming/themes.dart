import 'package:flutter/material.dart';

Color _iconColor = Colors.blueAccent.shade200;
const Color _lightPrimaryColor = Color(0xFF546E7A);
const Color _lightOnPrimaryColor = Colors.black;
const Color _lightSecondaryColor = Colors.lightGreenAccent;

const Color _darkPrimaryColor = Colors.white24;
const Color _darkPrimaryVariantColor = Colors.black38;
const Color _darkSecondaryColor = Colors.white;
const Color _darkOnPrimaryColor = Colors.white;

ThemeData customLightTheme() {
  final ThemeData lightTheme = ThemeData(
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(color: Colors.white,fontFamily: "Roboto",fontWeight: FontWeight.w300,fontSize: 22),
        color: _lightPrimaryColor,
        iconTheme: IconThemeData(color: _lightOnPrimaryColor),
      ),
      colorScheme: const ColorScheme.light(
        primary: _lightPrimaryColor,
        secondary: _lightSecondaryColor,
        onPrimary: _lightOnPrimaryColor,
      ),
      iconTheme: IconThemeData(
        color: _iconColor,
      ),
      textTheme: _lightTextTheme,
      dividerTheme: const DividerThemeData(
        color: Colors.black12
      )

  );


  return lightTheme;

}


ThemeData customDarkTheme() {

  final ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: _darkPrimaryVariantColor,
      iconTheme: IconThemeData(color: _darkOnPrimaryColor),
    ),
    colorScheme: const ColorScheme.dark(
      primary: _darkPrimaryColor,
      secondary: _darkSecondaryColor,
      onPrimary: _darkOnPrimaryColor,
      background: Colors.white12,
    ),
    iconTheme: IconThemeData(
      color: _iconColor,
    ),
    textTheme: _darkTextTheme,
    dividerTheme: const DividerThemeData(
      color: Colors.black
    )
  );

  return darkTheme;
}

const TextTheme _lightTextTheme = TextTheme(
  headline1: _lightScreenHeading1TextStyle,
);

final TextTheme _darkTextTheme = TextTheme(
  headline1: _darkScreenHeading1TextStyle,
);

const TextStyle _lightScreenHeading1TextStyle = TextStyle(fontSize: 22.0,fontWeight:FontWeight.bold, color: _lightOnPrimaryColor,fontFamily: "Roboto");

final TextStyle _darkScreenHeading1TextStyle = _lightScreenHeading1TextStyle.copyWith(color: _darkOnPrimaryColor);

