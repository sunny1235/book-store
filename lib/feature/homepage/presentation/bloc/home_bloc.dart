import 'package:book_store/config/base_usecase.dart';
import 'package:book_store/config/const.dart';
import 'package:book_store/feature/homepage/domain/entity/book_entity.dart';
import 'package:book_store/feature/homepage/domain/usecase/get_books_usecase.dart';
import 'package:book_store/feature/homepage/presentation/bloc/home_event.dart';
import 'package:book_store/feature/homepage/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final GetBooksUseCase repository;
  final SharedPreferences prefs;

  BookBloc(this.repository, this.prefs) : super(InitialBookState()) {
    on<LoadBooks>(_onLoad);
    on<ToggleFavorite>(_onToggle);
  }

  List<Book> favBooks = [];
  void _filterfavoriteBooks(List<Book> books) {
    List<Book> favorites = books.where((b) => b.isFavorite).toList();
    favBooks = favorites;
  }

  Future<void> _onLoad(LoadBooks event, Emitter<BookState> emit) async {
    try {
      final books = await repository.call(NoParams());
      books.fold(
        (l) {
          emit(FailureState());
        },
        (r) {
          final favIds = prefs.getStringList(AppConst.favKey) ?? [];
          List<Book> books =
              r
                  .map(
                    (m) => Book(
                      id: m.id,
                      title: m.title,
                      author: m.author,
                      imageUrl: m.imageUrl,
                      isFavorite: favIds.contains(m.id),
                    ),
                  )
                  .toList();
          List<Book> filteredBooks =
              books
                  .where(
                    (b) => b.title.toLowerCase().contains(
                      (event.query ?? '').toLowerCase(),
                    ),
                  )
                  .toList();
          _filterfavoriteBooks(books);
          emit(GetBooksSuccessState(books: filteredBooks));
        },
      );
    } catch (e) {
      emit(LoadingState(isLoading: false));
      emit(FailureState());
    }
  }

  Future<void> _onToggle(ToggleFavorite event, Emitter<BookState> emit) async {
    final favIds = prefs.getStringList(AppConst.favKey) ?? [];
    if (favIds.contains(event.bookId)) {
      favIds.remove(event.bookId);
    } else {
      favIds.add(event.bookId);
    }
    await prefs.setStringList(AppConst.favKey, favIds);
    add(LoadBooks());
  }
}
