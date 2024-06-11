import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

/*personalização da appbar para quando 
  o tema estiver claro a appbar ficara azul
  (obs: utilizar em todas as telas que possuam uma appbar)
*/
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
  });
  
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final themeMode = AdaptiveTheme.of(context).mode;

    Color backgroundColor;
    if (themeMode == AdaptiveThemeMode.light) {
      backgroundColor = Colors.blue;
    } else if (themeMode == AdaptiveThemeMode.dark) {
      backgroundColor = themeData.colorScheme.surface;
    } else if (themeMode == AdaptiveThemeMode.system) {
      backgroundColor = MediaQuery.platformBrightnessOf(context) == Brightness.light
          ? themeData.colorScheme.primary
          : themeData.colorScheme.surface;
    } else {
      backgroundColor = themeData.colorScheme.surface;
    }
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      leadingWidth: 80,
      title: Text(title),
      leading: leading,
      actions: actions,
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}