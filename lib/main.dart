import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:weather/config/app_theme.dart';
import 'package:weather/features/home/presentation/pages/home_page.dart';

import 'config/app_config.dart';
import 'core/injection/injection.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EasyLoading.instance.backgroundColor = Colors.orangeAccent;
  EasyLoading.instance.userInteractions = false;
  EasyLoading.instance.dismissOnTap = false;
  await configureInjection();
  GetIt.I<AppConfig>().initialize(
    appName: 'Weather',
    baseUrl: 'https://api.weatherapi.com/v1/',
  );
  HttpOverrides.global = MyHttpOverrides(); //call here
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
      home: FlutterEasyLoading(
        child: HomePage(),
      ),
    );
  }
}
