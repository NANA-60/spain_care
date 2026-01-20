import 'package:flutter/material.dart';
import 'package:spinecare/core/widgets/app_appbar.dart';
import 'package:spinecare/core/widgets/app_drawer.dart';
import 'package:spinecare/core/widgets/primary_button.dart';
import 'package:spinecare/features/result/result_controller.dart';
import 'package:spinecare/routes.dart';
import 'package:spinecare/core/localization/app_localizations.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final t = AppLocalizations.of(context);
    final result = ResultController.mock();

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppAppBar(
        title: t.translate('result'),
        showMenu: true,
        showBack: false,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  Text(
                    '${t.translate('diagnosis')}: ${result.diagnosis}',
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${t.translate('confidence')}: ${result.confidence}%',
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 10),
                  LinearProgressIndicator(
                    value: result.confidence / 100,
                    backgroundColor:
                    theme.colorScheme.primary.withOpacity(0.2),
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    result.message,
                    style: theme.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.all(20),
              child: PrimaryButton(
                title: t.translate('back_home'),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.home,
                        (route) => false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
