import 'package:book_store/config/failure_model.dart';
import 'package:book_store/feature/homepage/data/model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class BookRepository {
 Future<Either<FailureModel, List<BookModel>>> getBooks();
}