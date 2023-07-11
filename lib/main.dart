import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:testing_easy_localization/key_asset_loader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      useOnlyLangCode: true,
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
        Locale('fr'),
      ],
      path:
          'https://my-json-server.typicode.com/alejandrogiubel/translations/languages',
      assetLoader: KeyAssetLoader(),
      startLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('signup').tr(),
              const Text('email').tr(),
              const Text('password').tr(),
              ElevatedButton(
                onPressed: () {
                  context.setLocale(const Locale('en'));
                },
                child: const Text('Change to english'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.setLocale(const Locale('es'));
                },
                child: const Text('Change to spanish'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.setLocale(const Locale('fr'));
                },
                child: const Text('Change to french'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
