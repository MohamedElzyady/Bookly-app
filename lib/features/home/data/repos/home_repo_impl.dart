import 'package:book_app/core/errors/failuras.dart';
import 'package:book_app/core/utils/api_service.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewsBooks() async {
    try {
      final response = await apiService.get(
        'volumes?Filtering=free-ebooks&Sorting=newest&q=subject:computer science',
      );
      List<BookModel> books = [];
      for (var item in response['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      final response = await apiService.get(
        'volumes?Filtering=free-ebooks&q=subject:Programming',
      );

      List<BookModel> books = [];
      // 1. تأكد أن القائمة ليست فارغة أو null
      if (response['items'] != null) {
        for (var item in response['items']) {
          books.add(BookModel.fromJson(item));
        }
      }

      return right(books);
    } catch (e) {
      print("الخطأ الحقيقي هو: ${e.toString()}");
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      final response = await apiService.get(
        'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:Programming',
      );
      List<BookModel> books = [];
      // 1. تأكد أن القائمة ليست فارغة أو null
      if (response['items'] != null) {
        for (var item in response['items']) {
          books.add(BookModel.fromJson(item));
        }
      }
      return right(books);
    } catch (e) {
      print("الخطأ الحقيقي هو: ${e.toString()}");
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks({
    required String query,
  }) async {
    try {
      final encodedQuery = Uri.encodeQueryComponent(query);
      final response = await apiService.get(
        'volumes?Filtering=free-ebooks&Sorting=relevance&q=$encodedQuery',
      );
      List<BookModel> books = [];
      if (response['items'] != null) {
        for (var item in response['items']) {
          books.add(BookModel.fromJson(item));
        }
      }
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}
