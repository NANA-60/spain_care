import 'package:flutter/material.dart';
import '../colors/app_colors.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;
  final bool showMenu;

  const AppAppBar({
    super.key,
    required this.title,
    this.showBack = true,
    this.showMenu = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      backgroundColor: theme.appBarTheme.backgroundColor,
      elevation: theme.appBarTheme.elevation,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: showMenu
          ? Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.menu, color: theme.colorScheme.onSurface),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      )
          : showBack
          ? IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: theme.colorScheme.onSurface,
        ),
        onPressed: () => Navigator.pop(context),
      )
          : null,
      title: Text(
        title,
        style: theme.textTheme.titleLarge?.copyWith(
          color: theme.colorScheme.onSurface,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}