import 'package:book_app/core/errors/failuras.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchNewsBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category});
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks({
    required String query,
  });
}
