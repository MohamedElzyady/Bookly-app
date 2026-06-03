import 'package:book_app/core/utils/style.dart';
import 'package:book_app/features/home/presentation/view_model/books_cubit/featurs_books_cubit.dart';
import 'package:book_app/features/home/presentation/views/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeListview extends StatelessWidget {
  const HomeListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatursBooksCubit, FeatursBooksState>(
      builder: (context, state) {
        if (state is FeatursBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final imageBook = state.books[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(
                        context,
                      ).push('/bookDeatils', extra: state.books[index]);
                    },
                    child: ListItem(
                      imagUrl:
                          imageBook.volumeInfo.imageLinks?.thumbnail ??
                          'https://via.placeholder.com/150',
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeatursBooksFailure) {
          return Text(state.errormsg, style: Style.textStyle18);
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: Skeletonizer(
              enabled: true,
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: const SizedBox(
                      width: 130,
                      child: ColoredBox(color: Colors.white),
                    ),
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
