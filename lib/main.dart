import 'package:bookly_app/core/app_router.dart';
import 'package:bookly_app/core/constants/app_colors.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/book_feature/data/repositories/home_repo_impl.dart';
import 'package:bookly_app/features/book_feature/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/book_feature/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(getIt.get<HomeRepoImpl>())
                ..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(getIt.get<HomeRepoImpl>()),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.primaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
