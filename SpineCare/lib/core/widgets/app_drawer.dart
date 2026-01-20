import 'package:flutter/material.dart';
import 'package:spinecare/core/localization/app_localizations.dart';
import 'package:spinecare/routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final t = AppLocalizations.of(context);

    return Drawer(
      backgroundColor: theme.scaffoldBackgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: theme.colorScheme.primary),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(radius: 30, child: Icon(Icons.account_circle, size: 65)),
                  const SizedBox(height: 8),
                  Text('User Name', style: TextStyle(color: theme.colorScheme.onPrimary, fontWeight: FontWeight.bold)),
                  Text('user@email.com', style: TextStyle(color: theme.colorScheme.onPrimary.withOpacity(0.8))),
                ],
              ),
            ),
            _drawerItem(context, icon: Icons.home, title: t.translate('home'), onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, AppRoutes.home);
            }),
            _drawerItem(context, icon: Icons.settings, title: t.translate('settings'), onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, AppRoutes.settings);
            }),
            _drawerItem(context, icon: Icons.logout, title: t.translate('logout'), onTap: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login, (route) => false);
            }),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(BuildContext context, {required IconData icon, required String title, required VoidCallback onTap}) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Icon(icon, color: theme.colorScheme.primary),
      title: Text(title, style: TextStyle(color: theme.colorScheme.primary, fontWeight: FontWeight.w800,fontSize: 16)),
      onTap: onTap,
    );
  }
}
