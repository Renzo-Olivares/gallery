import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gallery/data/gallery_options.dart';
import 'package:gallery/l10n/gallery_localizations.dart';
import 'package:gallery/studies/reply/inbox.dart';
import 'package:gallery/studies/reply/colors.dart';
import 'package:gallery/layout/letter_spacing.dart';

class ReplyApp extends StatelessWidget {
  const ReplyApp();

  static const String homeRoute = '/reply';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reply',
      debugShowCheckedModeBanner: false,
      theme: _buildReplyLightTheme(context),
      localizationsDelegates: GalleryLocalizations.localizationsDelegates,
      supportedLocales: GalleryLocalizations.supportedLocales,
      locale: GalleryOptions.of(context).locale,
      initialRoute: homeRoute,
      routes: <String, WidgetBuilder>{
        homeRoute: (context) => const InboxPage(),
      },
    );
  }
}

ThemeData _buildReplyLightTheme(BuildContext context) {
  final base = ThemeData.light();
  return base.copyWith(
    scaffoldBackgroundColor: ReplyColors.blue50,
    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: ReplyColors.blue700,
      selectedIconTheme: const IconThemeData(color: ReplyColors.orange500),
      selectedLabelTextStyle:
          GoogleFonts.workSansTextTheme().copyWith().headline5.copyWith(
                color: ReplyColors.orange500,
              ),
      unselectedIconTheme: const IconThemeData(color: ReplyColors.blue200),
      unselectedLabelTextStyle:
          GoogleFonts.workSansTextTheme().copyWith().headline5.copyWith(
                color: ReplyColors.blue200,
              ),
    ),
    colorScheme: const ColorScheme.light(
      primary: ReplyColors.blue700,
      primaryVariant: ReplyColors.blue800,
      secondary: ReplyColors.orange500,
      secondaryVariant: ReplyColors.orange400,
      surface: ReplyColors.white50,
      error: ReplyColors.red400,
      onPrimary: ReplyColors.white50,
      onSecondary: ReplyColors.black900,
      onBackground: ReplyColors.black900,
      onSurface: ReplyColors.black900,
      onError: ReplyColors.black900,
      background: ReplyColors.blue50,
    ),
    canvasColor: ReplyColors.white50,
    accentColor: ReplyColors.orange500,
    textTheme: _buildReplyTextTheme(
      GoogleFonts.workSansTextTheme(Theme.of(context).textTheme),
    ),
  );
}

TextTheme _buildReplyTextTheme(TextTheme base) {
  return base.copyWith(
    headline4: base.headline4.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 34,
      letterSpacing: letterSpacingOrNone(0.4),
      height: 0.9,
      color: ReplyColors.black900,
    ),
    headline5: base.headline5.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      letterSpacing: letterSpacingOrNone(0.27),
      color: ReplyColors.black900,
    ),
    headline6: base.headline6.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      letterSpacing: letterSpacingOrNone(0.18),
      color: ReplyColors.black900,
    ),
    subtitle2: base.subtitle2.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 14,
      letterSpacing: letterSpacingOrNone(-0.04),
      color: ReplyColors.black900,
    ),
    bodyText1: base.bodyText1.copyWith(
      fontWeight: FontWeight.normal,
      fontSize: 18,
      letterSpacing: letterSpacingOrNone(0.2),
      color: ReplyColors.black900,
    ),
    bodyText2: base.bodyText2.copyWith(
      fontWeight: FontWeight.normal,
      fontSize: 14,
      letterSpacing: letterSpacingOrNone(-0.05),
      color: ReplyColors.black900,
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.normal,
      fontSize: 12,
      letterSpacing: letterSpacingOrNone(0.2),
      color: ReplyColors.black900,
    ),
  );
}
