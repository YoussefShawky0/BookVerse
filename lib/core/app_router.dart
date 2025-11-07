import 'package:bookly_app/features/book_feature/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/book_feature/presentation/views/home.dart';
import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:bookly_app/shared/splash/view/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: '/home', builder: (context, state) => const HomeView()),
      GoRoute(
        path: '/bookDetails',
        builder: (context, state) => BookDetailsView(),
      ),
      GoRoute(path: '/search', builder: (context, state) => const SearchView()),
    ],
  );
}
