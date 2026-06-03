part of 'featurs_books_cubit.dart';

@immutable
sealed class FeatursBooksState {}

final class FeatursBooksInitial extends FeatursBooksState {}

final class FeatursBooksLoading extends FeatursBooksState {}

final class FeatursBooksFailure extends FeatursBooksState {
  final String errormsg;

  FeatursBooksFailure(this.errormsg);
}

final class FeatursBooksSuccess extends FeatursBooksState {
  final List<BookModel> books;
  FeatursBooksSuccess(this.books);
}
