import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/book_feature/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/book_feature/data/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var response = await apiService.get(
        endpoint: 'volumes?Filtering=free-ebooks&q=subject:Programming',
      );
      List<BookModel> books = [];
      for (var item in response['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var response = await apiService.get(
        endpoint:
            'volumes?Filtering=free-ebooks&Sorting=newest &q=computer science',
      );
      List<BookModel> books = [];
      for (var item in response['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category}) async {
    try {
      var response = await apiService.get(
        endpoint: 'volumes?Filtering=free-ebooks&q=subject:$category&Sorting=relevance',
      );
      List<BookModel> books = [];
      for (var item in response['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }


}
