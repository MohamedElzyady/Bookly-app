import 'package:book_app/core/utils/style.dart';
import 'package:book_app/features/search/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:book_app/features/home/presentation/views/widgets/bestsellar_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return Center(
            child: Lottie.asset('assets/animation/Book Loader.json'),
          );
        } else if (state is SearchFailure) {
          return Center(
            child: Text(state.errorMessage, style: Style.textStyle14),
          );
        } else if (state is SearchSuccess) {
          if (state.books.isEmpty) {
            return const Center(
              child: Text('No books found', style: Style.textStyle14),
            );
          }
          return ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemCount: state.books.length,
            itemBuilder: (context, index) { 
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BestsellarText(book: state.books[index]),
              );
            },
          );
        }
        return const Center(child: Text('Type a book name and press search'));
      },
    );
  }
}
