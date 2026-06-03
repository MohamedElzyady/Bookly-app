import 'package:book_app/core/utils/style.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/presentation/views/widgets/bookrating.dart';
import 'package:book_app/features/home/presentation/views/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class BestsellarText extends StatelessWidget {
  const BestsellarText({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    final title = book.volumeInfo.title ?? 'Unknown title';
    final author =
        (book.volumeInfo.authors != null && book.volumeInfo.authors!.isNotEmpty)
        ? book.volumeInfo.authors!.first
        : 'Unknown author';

    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push('/bookDeatils', extra: book);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListItem(
              imagUrl:
                  book.volumeInfo.imageLinks?.thumbnail ??
                  'https://via.placeholder.com/150',
            ),
            const Gap(30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Style.textStyle20.copyWith(
                        fontFamily: 'GT Sectra',
                      ),
                    ),
                  ),
                  Text(author, style: Style.textStyle14),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Style.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      BookRating(mainAxisAlignment: MainAxisAlignment.start),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
