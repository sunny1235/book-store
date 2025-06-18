import 'package:book_store/config/base_usecase.dart';
import 'package:book_store/config/failure_model.dart';
import 'package:book_store/feature/homepage/data/model/book_model.dart';
import 'package:book_store/feature/homepage/domain/repository/get_books_repo.dart';
import 'package:dartz/dartz.dart';

class GetBooksUseCase
    extends UseCase<List<BookModel>, NoParams> {
  final BookRepository repository;

  GetBooksUseCase({required this.repository});

  @override
  Future<Either<FailureModel, List<BookModel>>> call(
      NoParams params) async {
    return await repository.getBooks();
  }
}
