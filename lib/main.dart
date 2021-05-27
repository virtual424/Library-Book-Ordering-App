import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mimi_project/Screens/BookDetailScreen.dart';


import 'package:mimi_project/resources/constants.dart';


import 'Screens/WelcomePage.dart';


void main() {
 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.white,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        canvasColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      routes: {
        '/': (ctx) => WelcomePage(),
        BookDetailScreen.routeName: (ctx) => BookDetailScreen(),
      },
    );
  }
}  
