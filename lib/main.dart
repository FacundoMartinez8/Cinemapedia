import 'package:cinemapedia/core/Routes/app_routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'core/service/dependecies_services.dart' as di;

import 'core/Theme/app_theme.dart';
import 'core/service/dependecies_services.dart';

Future<void> main() async {
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
      title: 'Flutter Demo',
      theme: AppTheme().getTheme(),
    );
  }
}
