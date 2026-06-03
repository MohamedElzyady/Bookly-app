part of 'favorites_cubit.dart';

@immutable
sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoaded extends FavoritesState {
  final List<BookModel> books;

  FavoritesLoaded(this.books);
}
