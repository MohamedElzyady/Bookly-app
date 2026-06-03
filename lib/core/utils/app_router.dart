import 'package:book_app/core/utils/service_locator.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/data/repos/home_repo_impl.dart';
import 'package:book_app/features/home/presentation/similar_books_cubit/similar_books_cubit.dart';
import 'package:book_app/features/home/presentation/views/book_details.dart';
import 'package:book_app/features/home/presentation/views/home.dart';
import 'package:book_app/features/search/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:book_app/features/search/presentation/views/search.dart';
import 'package:book_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: '/home', builder: (context, state) => const Home()),
      GoRoute(
        path: '/bookDeatils',
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(gettIt.get<HomeRepoImpl>()),
          child: BookDetails(bookModel: state.extra as BookModel),
        ),
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) => BlocProvider(
          create: (context) => SearchCubit(gettIt.get<HomeRepoImpl>()),
          child: const Search(),
        ),
      ),
    ],
  );
}
