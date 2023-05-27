import 'package:cinemapedia/core/Routes/app_routes.dart';
import 'package:cinemapedia/core/service/preferences_services.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'core/service/dependecies_services.dart' as di;

import 'core/Theme/app_theme.dart';

Future<void> main() async {
  //WidgetsFlutterBinding.ensureInitialized();

  await SharedPreferencesHelper.initialize();

  await di.setup();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      title: 'Cinemapedia',
      theme: AppTheme().getTheme(),
    );
  }
}
