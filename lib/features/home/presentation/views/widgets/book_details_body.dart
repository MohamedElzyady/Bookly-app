import 'package:book_app/core/utils/style.dart';
import 'package:book_app/features/constants.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/presentation/views/widgets/book_action.dart';
import 'package:book_app/features/home/presentation/views/widgets/bookrating.dart';
import 'package:book_app/features/home/presentation/views/widgets/custom_book_details_appbar.dart';
import 'package:book_app/features/home/presentation/views/widgets/derails_listview.dart';
import 'package:book_app/features/home/presentation/views/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final title = book.volumeInfo.title ?? 'Unknown title';
    final author =
        (book.volumeInfo.authors != null && book.volumeInfo.authors!.isNotEmpty)
        ? book.volumeInfo.authors!.first
        : 'Unknown author';
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const CustomBookDetailsAppbar(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * .18),
                  child: ListItem(
                    imagUrl: book.volumeInfo.imageLinks?.thumbnail ?? '',
                  ),
                ),
                const Gap(33),
                
                Text(
                  title,
                  style: Style.textStyle30,
                  textAlign: TextAlign.center,
                ),
                const Gap(5),
                Text(
                  author,
                  style: Style.textStyle18.copyWith(color: secondaryColor),
                ),
                const BookRating(mainAxisAlignment: MainAxisAlignment.center),
                const Gap(37),
                BookAction(
                  book: book,
                ),
                Expanded(child: const Gap(50)),
                const Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text('You can also read', style: Style.textStyle18),
                ),
                const Gap(17),
                const DerailsListview(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
