import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:mini_projet/Data/web_services/web_services.dart';
import 'package:mini_projet/constant/constant.dart';

import 'Data/Repository/repository.dart';
import 'ui/screen/Home_Screen.dart';

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
      home: RepositoryProvider(
        create: (context) => Repository(webService),
        child: HomeScreen(),
      ),
    );
  }
}
