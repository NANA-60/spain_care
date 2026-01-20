import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'core/localization/app_localizations_delegate.dart';
import 'core/localization/language_controller.dart';
import 'core/thame/app_theme.dart';
import 'core/thame/theme_controller.dart';
import 'routes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeController()),
        ChangeNotifierProvider(create: (_) => LanguageController()),
      ],
      child: const SpineCareApp(),
    ),
  );
}

class SpineCareApp extends StatelessWidget {
  const SpineCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = context.watch<ThemeController>();
    final lang = context.watch<LanguageController>();

    return MaterialApp(
      title: 'SpineCare',
      debugShowCheckedModeBanner: false,
      locale: lang.locale,
      supportedLocales: const [
        Locale('ar'),
        Locale('en')
      ],

      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      // Directionality handled automatically by Flutter based on locale
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeController.themeMode,
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.login,
    );
  }
}
