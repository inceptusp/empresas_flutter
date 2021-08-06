import 'package:empresas/shared/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

class EnterprisesApp extends StatefulWidget {
  const EnterprisesApp({Key? key}) : super(key: key);

  @override
  _EnterprisesAppState createState() => _EnterprisesAppState();
}

class _EnterprisesAppState extends State<EnterprisesApp> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _unfocusTextFields,
      child: MaterialApp(
        onGenerateTitle: (context) => EnterprisesLocalizations.of(context)!.title,
        supportedLocales: EnterprisesLocalizations.supportedLocales,
        localizationsDelegates: EnterprisesLocalizations.localizationsDelegates,
        theme: _lightTheme(),
        home: const SplashPage(),
      ),
    );
  }

  ThemeData _lightTheme() {
    return ThemeData(
      colorScheme: const ColorScheme.light().copyWith(
        primary: const Color(0xAAE01E69),
        secondary: const Color(0xAAFF2268),
      ),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        textTheme: Theme.of(context).textTheme.copyWith(
              headline6: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black),
            ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
    );
  }

  /// Unfocus text fields on tapping in any blank surface
  void _unfocusTextFields() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (currentFocus.focusedChild != null && !currentFocus.hasPrimaryFocus) {
      currentFocus.focusedChild!.unfocus();
    }
  }
}
