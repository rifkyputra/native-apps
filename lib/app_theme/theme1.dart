import 'package:flutter/material.dart';

import 'app_theme.dart';

const AppTheme themeLight = AppTheme(
  brightness: Brightness.light,
  colorScheme: AppColorScheme(
    accent: Colors.yellowAccent,
    onAccent: Colors.white60,
    onSurface: Colors.black87,
    surface: Colors.white,
  ),
  textTheme: AppTextTheme(
    body: BodySizesLato(),
    caption: BodySizesLato(),
    heading: HeadingSizesLato(),
    subheading: SubHeadingSizesLato(),
  ),
  spacing: AppSpacing(
    defaultMargin: EdgeInsets.symmetric(horizontal: 6, vertical: 20),
    defaultPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 20),
  ),
);

const AppTheme themeDark = AppTheme(
  brightness: Brightness.dark,
  colorScheme: AppColorScheme(
    accent: Color(0xFFEDC537),
    onAccent: Color(0xFF4E4012),
    onSurface: Color(0xFFE2E2E2),
    surface: Color(0xFF373737),
    background: Color(0xFF404040),
    primary: Color(0xFF2E4349),
    onPrimary: Color(0xFFA4CCD9),
  ),
  textTheme: AppTextTheme(
    body: BodySizesLato(),
    caption: BodySizesLato(),
    heading: HeadingSizesLato(),
    subheading: SubHeadingSizesLato(),
  ),
  spacing: AppSpacing(
    defaultMargin: EdgeInsets.symmetric(horizontal: 6, vertical: 20),
    defaultPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 20),
  ),
);
