import 'package:bloc/bloc.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'news_books_state.dart';

class NewsBooksCubit extends Cubit<NewsBooksState> {
  NewsBooksCubit(this.homeRepo) : super(NewsBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchNewsBooks() async {
    emit(NewsBooksLoading());
    final result = await homeRepo.fetchNewsBooks();
    result.fold(
      (failure) {
        emit(NewsBooksFailure(failure.errormsg));
      },
      (news) {
        emit(NewsBooksSuccess(news));
      },
    );
  }
}
