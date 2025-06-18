import 'package:book_store/feature/homepage/data/datasource/book_local_datasource.dart';
import 'package:book_store/feature/homepage/data/repository/get_books_repo_impl.dart';
import 'package:book_store/feature/homepage/domain/repository/get_books_repo.dart';
import 'package:book_store/feature/homepage/domain/usecase/get_books_usecase.dart';
import 'package:book_store/feature/homepage/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  final prefs = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => BookLocalDataSource());

  sl.registerLazySingleton<BookRepository>(() => BookRepositoryImpl(sl(), prefs));

  sl.registerLazySingleton(() => GetBooksUseCase(repository: sl()));

  sl.registerFactory(() => BookBloc(sl(),prefs));
}