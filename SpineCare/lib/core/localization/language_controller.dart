import 'package:flutter/material.dart';

class LanguageController extends ChangeNotifier {
  Locale _locale = const Locale('ar');

  Locale get locale => _locale;
  bool get isArabic => _locale.languageCode == 'ar';

  // تغيير باستخدام Locale
  void changeLanguage(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  // مساعدة لتغيير عبر الكود النصي
  void changeLanguageCode(String code) {
    changeLanguage(Locale(code));
  }
}
