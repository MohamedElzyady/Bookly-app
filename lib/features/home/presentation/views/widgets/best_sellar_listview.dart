import 'package:book_app/core/utils/responsive_helper.dart';
import 'package:book_app/core/utils/style.dart';
import 'package:book_app/features/home/presentation/view_model/newst_cubit/news_books_cubit.dart';
import 'package:book_app/features/home/presentation/views/widgets/item_book_mark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellarListview extends StatefulWidget {
  const BestSellarListview({super.key});

  @override
  State<BestSellarListview> createState() => _BestSellarListviewState();
}

class _BestSellarListviewState extends State<BestSellarListview> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBooksCubit, NewsBooksState>(
      builder: (context, state) {
        if (state is NewsBooksSuccess) {
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return ItemBookMarker(book: state.books[index]);
            },
          );
        } else if (state is NewsBooksFailure) {
          return Text(state.errormag, style: Style.textStyle18(context));
        } else {
          return Skeletonizer(
            enabled: true,
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: 6,
              separatorBuilder: (_, __) => SizedBox(height: context.h(12)),
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(context.w(13)),
                      child: SizedBox(
                        width: context.w(75),
                        height: context.h(120),
                        child: const ColoredBox(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: context.w(16)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: context.h(18),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(context.w(8)),
                            ),
                          ),
                          SizedBox(height: context.h(10)),
                          Container(
                            height: context.h(14),
                            width: context.w(130),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(context.w(8)),
                            ),
                          ),
                          SizedBox(height: context.h(12)),
                          Container(
                            height: context.h(16),
                            width: context.w(90),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(context.w(8)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        }
      },
    );
  }
}
