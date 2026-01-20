import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spinecare/core/localization/app_localizations.dart';
import 'package:spinecare/core/localization/language_controller.dart';
import 'package:spinecare/core/thame/theme_controller.dart';
import '../../../core/widgets/app_appbar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final lang = context.watch<LanguageController>();


    return Scaffold(
      appBar: AppAppBar(
        title: t.translate('settings'),
        showBack: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            /// 🌙 Appearance / Dark Mode
            _settingsCard(
              context,
              icon: Icons.dark_mode_outlined,
              title: t.translate('appearance'),
              child: Consumer<ThemeController>(
                builder: (_, themeController, __) {
                  return SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    value: themeController.isDark,
                    activeColor: theme.colorScheme.primary,
                    title: Text(t.translate('dark_mode')),
                    onChanged: themeController.toggleTheme,
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            /// 🌍 Language
            _settingsCard(
              context,
              icon: Icons.language_outlined,
              title: t.translate('language'),
              child: DropdownButton<Locale>(
                value: lang.locale,
                isExpanded: true,
                dropdownColor: Theme.of(context).colorScheme.onSecondary,
                // style: TextStyle(color: Theme.of(context).dividerColor),
                underline: const SizedBox(),
                items: const [
                  DropdownMenuItem(
                    value: Locale('ar'),
                    child: Text('العربية'),
                  ),
                  DropdownMenuItem(
                    value: Locale('en'),
                    child: Text('English'),
                  ),
                ],
                onChanged: (locale) {
                  if (locale != null) {
                    context.read<LanguageController>().changeLanguage(locale);
                  }
                },
              ),
            ),

            const SizedBox(height: 20),

            /// ℹ️ About App (Clickable)
            InkWell(
              borderRadius: BorderRadius.circular(25),
              onTap: () => _showAboutDialog(context),
              child: _settingsCard(
                context,
                icon: Icons.info_outline,
                title: t.translate('about_app'),
                child:Center()
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 Reusable Settings Card
  Widget _settingsCard(
      BuildContext context, {
        required IconData icon,
        required String title,
        required Widget child,
      }) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: theme.colorScheme.onPrimary),
              const SizedBox(width: 10),
              Text(title, style: theme.textTheme.titleMedium),
            ],
          ),
          const SizedBox(height: 15),
          child,
        ],
      ),
    );
  }

  /// 📄 About App Dialog
  void _showAboutDialog(BuildContext context) {
    final theme = Theme.of(context);

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(25),
          child: Column(

            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('SpineCare', style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize:20,fontWeight: FontWeight.bold, )
              ),
              const SizedBox(height: 15),
              Text(
                _aboutText,
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              Text(
                '⚠️ إخلاء مسؤولية طبية ',
                style: TextStyle(
                    color: Theme.of(context).
                    colorScheme.primary,fontSize:18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'هذا التطبيق لا يُغني عن استشارة الطبيب المختص، '
                    'والنتائج المعروضة هي نتائج مساعدة فقط وليست تشخيصًا نهائيًا.',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        );
      },
    );
  }

  /// 🧠 Generated About Text
  static const String _aboutText =
      'SpineCare هو تطبيق طبي ذكي يهدف إلى تحليل صور الرنين المغناطيسي (MRI) '
      'للعمود الفقري باستخدام تقنيات الذكاء الاصطناعي.\n\n'
      'يقوم التطبيق بإرسال الصور إلى نموذج ذكاء اصطناعي مدرّب مسبقًا '
      'ويعمل عبر واجهة برمجية (API) مبنية باستخدام Flask، '
      'ثم يعرض النتائج بشكل مبسط للمستخدم.\n\n'
      'التطبيق متوفر لأنظمة Android و iOS، '
      'وتم تصميمه ليكون أداة مساعدة للأطباء والمرضى.';
}
