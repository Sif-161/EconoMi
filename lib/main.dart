import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'tela_login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(FinanceiroApp(savedThemeMode: savedThemeMode));
}

class FinanceiroApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;
  const FinanceiroApp({super.key, this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.blue,
      ),
      dark: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blue,
      ),
      initial: savedThemeMode ?? AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        darkTheme: darkTheme,
        home: TelaLogin(),
      ),
    );
  }
}