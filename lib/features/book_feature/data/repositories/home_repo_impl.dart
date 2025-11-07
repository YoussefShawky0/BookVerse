import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/book_feature/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/book_feature/data/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks() {
    // TODO: implement fetchBestSellerBooks
    throw UnimplementedError();
  }
}
