import 'package:charlykeleb/pages/home.dart';
import 'package:charlykeleb/util/constants.dart';
import 'package:charlykeleb/util/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.name,
      theme: ThemeConfig.lightTheme.copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const Home(),
    );
  }
}
