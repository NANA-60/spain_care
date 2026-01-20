import 'dart:io';

import 'package:flutter/material.dart';
import 'package:spinecare/core/widgets/app_appbar.dart';
import 'package:spinecare/core/widgets/app_drawer.dart';
import 'package:spinecare/core/widgets/primary_button.dart';
import 'package:spinecare/features/upload/upload_controller.dart';
import 'package:spinecare/routes.dart';
import 'package:spinecare/core/localization/app_localizations.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  // final UploadController controller = UploadController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final t = AppLocalizations.of(context);

    final File? image =
    ModalRoute.of(context)!.settings.arguments as File?;

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppAppBar(
        title: t.translate('analysis'),
        showMenu: true,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: image == null
                  ? Icon(
                Icons.image,
                size: 100,
                color: theme.colorScheme.onPrimary,
              )
                  : Image.file(
                image,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.all(20),
              child: PrimaryButton(
                title: t.translate('analysis'),
                onPressed: () async {
                  if (image == null) return;

                  await UploadController().analyzeImage();
                  Navigator.pushNamed(context, AppRoutes.waiting);
                },
              ),

            ),
          ],
        ),
      ),
    );
  }
}
