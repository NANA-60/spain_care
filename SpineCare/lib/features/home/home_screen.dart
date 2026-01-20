import 'package:flutter/material.dart';
import 'package:spinecare/core/widgets/app_appbar.dart';
import 'package:spinecare/core/widgets/app_drawer.dart';
import 'package:spinecare/features/upload/upload_controller.dart';
import 'package:spinecare/routes.dart';
import 'package:spinecare/core/widgets/primary_button.dart';
import 'package:spinecare/core/localization/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UploadController controller = UploadController();

  void _showImageSourceDialog(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);

    showModalBottomSheet(
      context: context,
      backgroundColor: theme.splashColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: Text(t.translate('camera')),
                onTap: () async {
                  final image = await controller.pickFromCamera();
                  Navigator.pop(context);

                  if (image != null) {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.upload,
                      arguments: image,
                    );
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: Text(t.translate('gallery')),
                onTap: () async {
                  final image = await controller.pickFromGallery();
                  Navigator.pop(context);

                  if (image != null) {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.upload,
                      arguments: image,
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final t = AppLocalizations.of(context);

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppAppBar(
        title: t.translate('home'),
        showMenu: true,
        showBack: false,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),

            GestureDetector(
              onTap: () => _showImageSourceDialog(context),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 80),
                height: 150,
                width: 220,
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cloud_upload_outlined,
                        size: 60,
                        color: theme.colorScheme.onPrimary),
                    const SizedBox(height: 10),
                    Text(
                      t.translate('upload_image'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: theme.colorScheme.onPrimary,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: PrimaryButton(
            //     title: t.translate('continue'),
            //     onPressed: controller.selectedImage == null
            //         ? () {} // أو null إن أحببت
            //         : () {
            //       Navigator.pushNamed(
            //         context,
            //         AppRoutes.upload,
            //         arguments: controller.selectedImage,
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
