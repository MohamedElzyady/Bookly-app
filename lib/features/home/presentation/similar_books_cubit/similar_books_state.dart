part of 'similar_books_cubit.dart';

@immutable
sealed class SimilarBooksState {}

final class SimilarBooksInitial extends SimilarBooksState {}

final class SimilarBooksLoading extends SimilarBooksState {}

final class SimilarBooksFailure extends SimilarBooksState {
  final String errormsg;
  SimilarBooksFailure(this.errormsg);
}

final class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookModel> books;
  SimilarBooksSuccess(this.books);
}
