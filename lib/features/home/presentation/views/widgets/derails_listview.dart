import 'package:book_app/features/home/presentation/similar_books_cubit/similar_books_cubit.dart';
import 'package:book_app/features/home/presentation/views/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DerailsListview extends StatelessWidget {
  const DerailsListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .16,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ListItem(
                    imagUrl:
                        state.books[index].volumeInfo.imageLinks?.thumbnail ??
                        '',
                  ),
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return Text(state.errormsg);
        } else {
          return const Center(
            child: CircularProgressIndicator(color: Colors.red),
          );
        }
      },
    );
  }
}
