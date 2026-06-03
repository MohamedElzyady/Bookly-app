import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesLoaded(const []));

  List<BookModel> get books {
    if (state is FavoritesLoaded) {
      return (state as FavoritesLoaded).books;
    }
    return const [];
  }

  bool isBookBookmarked(BookModel book) {
    final identity = _bookIdentity(book);
    return books.any((element) => _bookIdentity(element) == identity);
  }

  void toggleBook(BookModel book) {
    final targetIdentity = _bookIdentity(book);
    final updatedBooks = List<BookModel>.from(books);
    final index = updatedBooks.indexWhere(
      (element) => _bookIdentity(element) == targetIdentity,
    );

    if (index == -1) {
      updatedBooks.add(book);
    } else {
      updatedBooks.removeAt(index);
    }

    emit(FavoritesLoaded(updatedBooks));
  }

  void removeBook(BookModel book) {
    final targetIdentity = _bookIdentity(book);
    final updatedBooks = List<BookModel>.from(books)
      ..removeWhere((element) => _bookIdentity(element) == targetIdentity);
    emit(FavoritesLoaded(updatedBooks));
  }

  String _bookIdentity(BookModel book) {
    if (book.id != null && book.id!.trim().isNotEmpty) {
      return 'id:${book.id}';
    }
    if (book.selfLink != null && book.selfLink!.trim().isNotEmpty) {
      return 'link:${book.selfLink}';
    }
    final title = book.volumeInfo.title?.trim() ?? '';
    final author =
        (book.volumeInfo.authors != null && book.volumeInfo.authors!.isNotEmpty)
        ? book.volumeInfo.authors!.first.trim()
        : '';
    if (title.isNotEmpty || author.isNotEmpty) {
      return 'title:$title|author:$author';
    }
    // Last fallback for malformed API books.
    return 'fallback:${book.hashCode}';
  }
}
