import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_intern/const/colors.dart';
import 'package:test_intern/core/injection_container.dart';
import 'package:test_intern/screens/bottom_bar_screen.dart';

void main() {
  initGetIt();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: ColorProject.purple,
              centerTitle: true,
              titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.raleway().fontFamily,
                  
                  color: ColorProject.white)),
          scaffoldBackgroundColor: ColorProject.background,
          textTheme: Theme.of(context).textTheme.apply(
              displayColor: ColorProject.white,
              bodyColor: ColorProject.white,
              fontFamily: GoogleFonts.raleway().fontFamily),
        ),
        home: const BottomBarScreen());
  }
}
