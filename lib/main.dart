import 'package:calculator_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/home_screen/home_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator App',
      theme: ThemeData(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: Theme.of(context).textTheme.apply(
                fontFamily: '',
                bodyColor: kSecondaryColor,
              )),
      home: const HomeScreen(),
    );
  }
}
