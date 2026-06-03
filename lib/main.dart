import 'package:book_app/core/utils/app_router.dart';
import 'package:book_app/core/utils/service_locator.dart';
import 'package:book_app/features/constants.dart';
import 'package:book_app/features/favorite/presentation/view_model/favorites_cubit/favorites_cubit.dart';
import 'package:book_app/features/home/data/repos/home_repo_impl.dart';
import 'package:book_app/features/home/presentation/view_model/books_cubit/featurs_books_cubit.dart';
import 'package:book_app/features/home/presentation/view_model/newst_cubit/news_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeatursBooksCubit(gettIt.get<HomeRepoImpl>())
                ..fetchfeatureBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewsBooksCubit(gettIt.get<HomeRepoImpl>())..fetchNewsBooks(),
        ),
        BlocProvider(create: (context) => FavoritesCubit()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: primaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
