import 'package:book_store/config/failure_model.dart';
import 'package:book_store/feature/homepage/data/datasource/book_local_datasource.dart';
import 'package:book_store/feature/homepage/data/model/book_model.dart';
import 'package:book_store/feature/homepage/domain/repository/get_books_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookRepositoryImpl implements BookRepository {
  final BookLocalDataSource localDataSource;
  final SharedPreferences prefs;

  BookRepositoryImpl(this.localDataSource, this.prefs);


  @override
  Future<Either<FailureModel, List<BookModel>>> getBooks() async {
    final res = await localDataSource.getBooks();
    return res;
  }

}