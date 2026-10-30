import 'package:book_app/core/utils/responsive_helper.dart';
import 'package:book_app/core/utils/style.dart';
import 'package:book_app/features/constants.dart';
import 'package:book_app/features/favorite/presentation/view_model/favorites_cubit/favorites_cubit.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/presentation/views/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteBookCard extends StatelessWidget {
  const FavoriteBookCard({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.w(16)),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(context.w(14)),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: context.w(72),
            height: context.h(108),
            child: ListItem(
              imagUrl:
                  book.volumeInfo.imageLinks?.thumbnail ??
                  'https://via.placeholder.com/150',
            ),
          ),
          SizedBox(width: context.w(16)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        book.volumeInfo.title ?? 'Unknown title',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Style.textStyle18(context).copyWith(
                          fontFamily: kGtSectraFine,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<FavoritesCubit>().removeBook(book);
                      },
                      splashRadius: context.w(20),
                      icon: Icon(
                        Icons.bookmark_rounded,
                        color: Colors.amber,
                        size: context.sp(24),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.h(4)),
                Text(
                  (book.volumeInfo.authors != null &&
                          book.volumeInfo.authors!.isNotEmpty)
                      ? book.volumeInfo.authors!.first
                      : 'Unknown author',
                  style: TextStyle(
                    fontSize: context.sp(14),
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: context.h(10)),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.w(12),
                    vertical: context.h(6),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.07),
                    borderRadius: BorderRadius.circular(context.w(30)),
                  ),
                  child: Text(
                    (book.volumeInfo.categories != null &&
                            book.volumeInfo.categories!.isNotEmpty)
                        ? book.volumeInfo.categories!.first
                        : 'General',
                    style: TextStyle(
                      fontSize: context.sp(13),
                      color: Colors.white.withValues(alpha: 0.9),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
