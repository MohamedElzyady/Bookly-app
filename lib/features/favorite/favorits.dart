import 'package:book_app/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_app/core/utils/style.dart';
import 'package:book_app/features/constants.dart';
import 'package:book_app/features/favorite/presentation/view_model/favorites_cubit/favorites_cubit.dart';
import 'package:book_app/features/favorite/presentation/views/widgets/empty_favorites.dart';
import 'package:book_app/features/favorite/presentation/views/widgets/favorite_book_card.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';

class Favorits extends StatelessWidget {
  const Favorits({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        final books = state is FavoritesLoaded ? state.books : <BookModel>[];
        return Scaffold(
          backgroundColor: primaryColor,
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    context.w(20), context.h(50), context.w(20), context.h(20),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.06),
                      borderRadius: BorderRadius.circular(context.w(16)),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.07),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(context.w(16)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.bookmark_added_rounded,
                            color: Colors.amber,
                            size: context.sp(28),
                          ),
                          SizedBox(width: context.w(12)),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Favorite Books',
                                  style: Style.textStyle18(context),
                                ),
                                SizedBox(height: context.h(4)),
                                Text(
                                  '${books.length} saved from Home',
                                  style: Style.textStyle14(context).copyWith(
                                    color: secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (books.isEmpty)
                const SliverFillRemaining(
                  hasScrollBody: false,
                  child: EmptyFavorites(),
                )
              else
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(
                    context.w(20), 0, context.w(20), context.h(20),
                  ),
                  sliver: SliverList.separated(
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      return FavoriteBookCard(book: books[index]);
                    },
                    separatorBuilder: (_, __) => SizedBox(height: context.h(14)),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
