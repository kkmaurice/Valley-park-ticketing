import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splash_view/splash_view.dart';
import 'package:tickler/Screens/main_screen.dart';

import 'package:tickler/provider/provider.dart';

void main() {
  runApp(const MyApp());
  Provider.debugCheckInvalidValueType = null;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Controller(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashView(
          duration: const Duration(seconds: 5),
          backgroundColor: Colors.black,
          logo: SizedBox(
            height: 200,
            width: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const Image(
                image: AssetImage('assets/Afrosoft-Logo.jpg'),
              ),
            ),
          ),
          title: const Text(
            'Valley Park',
            style: TextStyle(
              color: Colors.white,
              fontSize: 33,
              fontWeight: FontWeight.bold,
            ),
          ),
          //loadingIndicator: const CircularProgressIndicator(),
          done: Done(const MainScreen()),
        ),
      ),
    );
  }
}
