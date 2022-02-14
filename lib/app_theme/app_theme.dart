import 'package:flutter/material.dart';

abstract class TextThemeSizes {
  final TextStyle small;
  final TextStyle medium;
  final TextStyle large;
  final TextStyle huge;

  const TextThemeSizes(this.small, this.medium, this.large, this.huge);
}

class BodySizesLato implements TextThemeSizes {
  const BodySizesLato();

  static const String lato = 'lato';

  @override
  final TextStyle small = const TextStyle(
    fontSize: 10,
    fontFamily: lato,
  );

  @override
  final TextStyle medium = const TextStyle(
    fontSize: 12,
    fontFamily: lato,
  );

  @override
  final TextStyle large = const TextStyle(
    fontSize: 14,
    fontFamily: lato,
  );

  @override
  final TextStyle huge = const TextStyle(
    fontSize: 16,
    fontFamily: lato,
  );
}

class SubHeadingSizesLato implements TextThemeSizes {
  static const String lato = 'lato';

  const SubHeadingSizesLato();

  @override
  TextStyle get huge => const TextStyle(
        fontSize: 30,
        fontFamily: lato,
      );

  @override
  TextStyle get large => const TextStyle(
        fontSize: 30,
        fontFamily: lato,
      );

  @override
  TextStyle get medium => const TextStyle(
        fontSize: 30,
        fontFamily: lato,
      );

  @override
  TextStyle get small => const TextStyle(
        fontSize: 30,
        fontFamily: lato,
      );
}

class HeadingSizesLato implements TextThemeSizes {
  static const String lato = 'lato';

  const HeadingSizesLato();

  @override
  TextStyle get huge => const TextStyle(
        fontSize: 42,
        fontFamily: lato,
      );

  @override
  TextStyle get large => const TextStyle(
        fontSize: 36,
        fontFamily: lato,
      );
  @override
  TextStyle get medium => const TextStyle(
        fontSize: 33,
        fontFamily: lato,
      );
  @override
  TextStyle get small => const TextStyle(
        fontSize: 28,
        fontFamily: lato,
      );
}

///
///
/// ```
/// usage :
///
/// Text(
///   'Headline of a news',
///   style: AppTheme.
/// )
///
///
/// ```
///
///
class AppTheme {
  final AppTextTheme textTheme;
  final Brightness brightness;
  final AppColorScheme colorScheme;
  final AppSpacing? spacing;

  const AppTheme({
    required this.textTheme,
    required this.brightness,
    required this.colorScheme,
    this.spacing,
  });

  ThemeData get themeData => ThemeData(
        brightness: brightness,
        primaryColor: colorScheme.primary,
        colorScheme: ColorScheme(
          background: colorScheme.background,
          brightness: brightness,
          error: colorScheme.error,
          onBackground: colorScheme.onSurface,
          onError: colorScheme.error,
          onPrimary: colorScheme.onPrimary,
          onSecondary: colorScheme.onSecondary,
          onSurface: colorScheme.onSurface,
          primary: colorScheme.primary,
          secondary: colorScheme.secondary,
          surface: colorScheme.surface,
        ),
      );

  ThemeData combineThemeData(ThemeData themeData) => ThemeData(
        brightness: brightness,
        primaryColor: colorScheme.primary,
        colorScheme: ColorScheme(
          background: colorScheme.background,
          brightness: brightness,
          error: colorScheme.error,
          onBackground: colorScheme.onSurface,
          onError: colorScheme.error,
          onPrimary: colorScheme.onPrimary,
          onSecondary: colorScheme.onSecondary,
          onSurface: colorScheme.onSurface,
          primary: colorScheme.primary,
          secondary: colorScheme.secondary,
          surface: colorScheme.surface,
        ),
        appBarTheme: themeData.appBarTheme,
        // bannerTheme: themeData.bannerTheme,
        // textTheme: themeData.textTheme,
        // buttonBarTheme: themeData.buttonBarTheme,
        // bottomAppBarTheme: themeData.bottomAppBarTheme,
        // bottomSheetTheme: themeData.bottomSheetTheme,
        // buttonTheme: themeData.buttonTheme,
        // cardTheme: themeData.cardTheme,
        // chipTheme: themeData.chipTheme,
        // iconTheme: themeData.iconTheme,
        // dialogTheme: themeData.dialogTheme,
        // tabBarTheme: themeData.tabBarTheme,
        // checkboxTheme: themeData.checkboxTheme,
        // snackBarTheme: themeData.snackBarTheme,
        // primaryTextTheme: themeData.primaryTextTheme,
      );
}

class AppTextTheme {
  final TextThemeSizes heading;
  final TextThemeSizes subheading;
  final TextThemeSizes body;
  final TextThemeSizes caption;

  const AppTextTheme({
    required this.heading,
    required this.subheading,
    required this.body,
    required this.caption,
  });
}

class AppColorScheme {
  /// Accent can be from system or above primary color's priority
  final Color accent;
  final Color onAccent;

  final Color background;

  /// Surface is container default color usually quite similar to background color
  /// e.g. card, container, tiles, panes, menus
  final Color surface;
  final Color onSurface;
  final Color onSurfaceSecondary;
  final Color onSurfaceDisabled;

  /// Primary color beside accent
  final Color primary;
  final Color onPrimary;

  /// Secondary color
  final Color secondary;
  final Color onSecondary;

  /// Tertiary Color
  final Color tertiary;
  final Color onTertiary;

  /// Error is usually error text, and error surface is the background
  final Color errorSurface;
  final Color error;

  /// Success is usually success text, and succes surface is the background
  final Color successSurface;
  final Color success;

  /// Confirm is usually Confirm text, and Confirm surface is the background
  final Color confirmSurface;
  final Color confirm;

  /// Warning is usually Warning text and Warning surface is the background
  final Color warningSurface;
  final Color warning;

  final Color border;
  final Color border2;

  final Color link;

  final Color splash;

  const AppColorScheme({
    required this.accent,
    required this.onAccent,
    required this.surface,
    required this.onSurface,
    Color? onSurfaceSecondary,
    Color? background,
    Color? onSurfaceDisabled,
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? tertiary,
    Color? onTertiary,
    Color? errorSurface,
    Color? error,
    Color? successSurface,
    Color? success,
    Color? confirmSurface,
    Color? confirm,
    Color? warningSurface,
    Color? warning,
    Color? border,
    Color? border2,
    Color? link,
    Color? splash,
  })  : background = background ?? accent,
        onSurfaceSecondary = onSurfaceSecondary ?? onSurface,
        onSurfaceDisabled = onSurfaceDisabled ?? onSurface,
        primary = primary ?? accent,
        onPrimary = onPrimary ?? onSurface,
        secondary = secondary ?? accent,
        onSecondary = onSecondary ?? onSurface,
        tertiary = tertiary ?? accent,
        onTertiary = onTertiary ?? onSurface,
        errorSurface = errorSurface ?? accent,
        error = error ?? onSurface,
        successSurface = successSurface ?? accent,
        success = success ?? onSurface,
        confirmSurface = confirmSurface ?? accent,
        confirm = confirm ?? onSurface,
        warningSurface = warningSurface ?? accent,
        warning = warning ?? onSurface,
        border = border ?? onSurface,
        border2 = border2 ?? onSurface,
        link = link ?? onSurface,
        splash = splash ?? accent;
}

class AppSpacing {
  final EdgeInsets defaultPadding;
  final EdgeInsets defaultMargin;
  final EdgeInsets? inlineContentPadding;
  final EdgeInsets? verticalPadding;
  final EdgeInsets? horizontalPadding;
  final EdgeInsets? cardPadding;
  final EdgeInsets? iconPadding;
  final SizedBox? spaceHorizontal;
  final SizedBox? spaceVertical;
  final Widget? thinBreak;
  final Widget? thickBreak;

  const AppSpacing({
    required this.defaultPadding,
    required this.defaultMargin,
    this.inlineContentPadding,
    this.verticalPadding,
    this.horizontalPadding,
    this.cardPadding,
    this.iconPadding,
    this.spaceHorizontal,
    this.spaceVertical,
    this.thinBreak,
    this.thickBreak,
  });
}
