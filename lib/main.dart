import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:barbershop/barbershop.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: ThemeMode.system,
      getPages: routes,
      initialBinding: AppInjector(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale('pt', 'BR')],
    );
  }
}
