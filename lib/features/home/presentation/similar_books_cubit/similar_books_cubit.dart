import 'package:bloc/bloc.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/data/repos/home_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchSimilarBook({required String category}) async {
    emit(SimilarBooksLoading());
    final result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold(
      (faliure) {
        emit(SimilarBooksFailure(faliure.errormsg));
      },
      (books) {
        emit(SimilarBooksSuccess(books));
      },
    );
  }
}
