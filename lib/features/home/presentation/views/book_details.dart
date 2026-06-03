import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/presentation/similar_books_cubit/similar_books_cubit.dart';
import 'package:book_app/features/home/presentation/views/widgets/book_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetails extends StatefulWidget {
  const BookDetails({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  void initState() {
    final categories = widget.bookModel.volumeInfo.categories;
    BlocProvider.of<SimilarBooksCubit>(
      context,
    ).fetchSimilarBook(
      category: (categories != null && categories.isNotEmpty)
          ? categories.first
          : 'Programming',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: BookDetailsBody(book: widget.bookModel)),
    );
  }
}
