import 'package:cinemapedia/core/Routes/app_routes.dart';
import 'package:cinemapedia/features/movies/domain/entities/movie.dart';
import 'package:cinemapedia/features/movies/domain/usecase/get_now_playing_use_case.dart';
import 'package:cinemapedia/features/movies/presentation/bloc/movies_bloc.dart';
import 'package:cinemapedia/features/movies/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Flutter Demo',
      theme: AppTheme().getTheme(),
    );
  }
}
