import 'package:bookly_app/core/app_router.dart';
import 'package:bookly_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.primaryColor,
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      
    );
  }
}
