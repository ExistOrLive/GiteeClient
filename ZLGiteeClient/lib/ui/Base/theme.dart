import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Colors
const kAppBarBackgroundLightColor = Color(0xFFFBF9FB);
const kAppBarBackgroundDarkColor = Color(0xFF1E2022);
const kPrimaryColor = Color(0xFFFBF9FB);
const kPrimaryDarkColor = Color(0xFF1E2022);
const kSecondaryLightColor = Color(0xFFE4E9F2);
const kSecondaryDarkColor = Color(0xFF404040);
const kAccentLightColor = Color(0xFFB3BFD7);
const kAccentDarkColor = Color(0xFF4E4E4E);
const kBackgroundLightColor = Color(0xFFFFFFFF);
const kBackgroundDarkColor = Color(0xFF17181C);
const kSurfaceDarkColor = Color(0xFF222225);

const kScaffoldBackgroundColor = Color(0xFFF6F6F6);
const kScaffoldBackgroundDarkColor = Color(0xFF0D1014);
// Icon Colors
const kAccentIconLightColor = Color(0xFFECEFF5);
const kAccentIconDarkColor = Color(0xFF303030);
const kPrimaryIconLightColor = Color(0xFFECEFF5);
const kPrimaryIconDarkColor = Color(0xFF232323);
// Text Colors

const kIconColorLight = Color(0xFF666666);
const kIconColorDark = Color(0xFF999999);
const kBodyTextColorLight1 = Color(0xFF666666);
const kBodyTextColorDark1 = Color(0xFF999999);
const kBodyTextColorLight2 = Color(0xFF586069);
const kBodyTextColorDark2 = Color(0xFF999999);
const kTitleTextLightColor1 = Colors.black;
const kTitleTextDarkColor1 = Colors.white;
const kTitleTextLightColor2 = Color(0xFF333333);
const kTitleTextDarkColor2 = Color(0xFFCCCCCC);

const kShadowColor = Color(0xFF364564);

ThemeData themeData(BuildContext context) {
  return ThemeData(
    appBarTheme: appBarTheme,
    primaryColor: kPrimaryColor,
    accentColor: kAccentLightColor,
    scaffoldBackgroundColor: kScaffoldBackgroundColor,
    colorScheme: ColorScheme.light(
      secondary: kSecondaryLightColor,
      // on light theme surface = Colors.white by default
    ),
    backgroundColor: kBackgroundLightColor,
    iconTheme: IconThemeData(color: kIconColorLight),
    accentIconTheme: IconThemeData(color: kAccentIconLightColor),
    primaryIconTheme: IconThemeData(color: kPrimaryIconLightColor),
    textTheme: GoogleFonts.latoTextTheme().copyWith(
      subtitle1: TextStyle(color: kTitleTextLightColor1),
      subtitle2: TextStyle(color: kTitleTextLightColor2),
      bodyText1:
          TextStyle(color: kBodyTextColorLight1, fontWeight: FontWeight.w400),
      bodyText2:
          TextStyle(color: kBodyTextColorLight2, fontWeight: FontWeight.w400),
    ),
  );
}

// Dark Them
ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryDarkColor,
    accentColor: kAccentDarkColor,
    scaffoldBackgroundColor: kScaffoldBackgroundDarkColor,
    appBarTheme: appBarDarkTheme,
    colorScheme: ColorScheme.light(
      secondary: kSecondaryDarkColor,
      surface: kSurfaceDarkColor,
    ),
    backgroundColor: kBackgroundLightColor,
    iconTheme: IconThemeData(color: kIconColorDark),
    accentIconTheme: IconThemeData(color: kAccentIconDarkColor),
    primaryIconTheme: IconThemeData(color: kPrimaryIconDarkColor),
    textTheme: GoogleFonts.latoTextTheme().copyWith(
      bodyText1: TextStyle(color: kBodyTextColorDark1),
      bodyText2: TextStyle(color: kBodyTextColorDark2),
      subtitle1: TextStyle(color: kTitleTextDarkColor1),
      subtitle2: TextStyle(color: kTitleTextDarkColor2),
    ),
  );
}

AppBarTheme appBarTheme =
    AppBarTheme(backgroundColor: kAppBarBackgroundLightColor, elevation: 0);
AppBarTheme appBarDarkTheme =
    AppBarTheme(backgroundColor: kAppBarBackgroundDarkColor, elevation: 0);
