import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/data/repos/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.homeRepo) : super(SearchInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSearchBooks(String query) async {
    if (query.trim().isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());
    final result = await homeRepo.fetchSearchBooks(query: query.trim());
    result.fold(
      (failure) => emit(SearchFailure(failure.errormsg)),
      (books) => emit(SearchSuccess(books)),
    );
  }
}
