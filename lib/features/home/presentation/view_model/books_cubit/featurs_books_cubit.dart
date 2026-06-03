import 'package:bloc/bloc.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'featurs_books_state.dart';

class FeatursBooksCubit extends Cubit<FeatursBooksState> {
  FeatursBooksCubit(this.homeRepo) : super(FeatursBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchfeatureBooks() async {
    emit(FeatursBooksLoading());
    final result = await homeRepo.fetchFeaturedBooks();
    result.fold(
      (faliure) {
        emit(FeatursBooksFailure(faliure.errormsg));
      },
      (books) {
        emit(FeatursBooksSuccess(books));
      },
    );
  }
}
