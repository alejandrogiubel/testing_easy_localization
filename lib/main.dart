import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:testing_easy_localization/key_asset_loader.dart';

const en = Locale.fromSubtags(countryCode: 'US', languageCode: 'en');
const es = Locale.fromSubtags(countryCode: 'ES', languageCode: 'es');
const fr = Locale.fromSubtags(countryCode: 'FR', languageCode: 'fr');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        en,
        es,
        fr,
      ],
      path:
          'https://my-json-server.typicode.com/alejandrogiubel/translations/languages',
      assetLoader: KeyAssetLoader(),
      startLocale: en,
      fallbackLocale: en,
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
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(context.tr('signup')),
            const Text('email').tr(),
            const Text('password').tr(),
            ElevatedButton(
              onPressed: () {
                context.setLocale(en);
              },
              child: const Text('Change to english'),
            ),
            ElevatedButton(
              onPressed: () {
                context.setLocale(es);
              },
              child: const Text('Change to spanish'),
            ),
            ElevatedButton(
              onPressed: () {
                context.setLocale(fr);
              },
              child: const Text('Change to french'),
            ),
          ],
        ),
      ),
    );
  }
}
