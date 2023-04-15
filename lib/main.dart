import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_projet/Data/web_services/web_services.dart';
import 'package:mini_projet/UI/screen/Home_Screen.dart';

import 'Data/Repository/repository.dart';
import 'UI/screen/Splash_Screen.dart';

void main() {
  runApp(const MyApp());
}

WebServices webService = WebServices();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 3)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SplashScreen();
            } else {
              return RepositoryProvider(
                create: (context) => Repository(webService),
                child: const HomeScreen(),
              );
            }
          }),
    );
  }
}
