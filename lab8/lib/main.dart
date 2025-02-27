import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lab8/home_page.dart';
import 'package:lab8/translations/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ru')],
      path: 'assets/translations', // <-- change the path of the translation files 
      fallbackLocale: Locale('en'),
      assetLoader: CodegenLoader(),
      child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: HomePage()
    );
  }
}