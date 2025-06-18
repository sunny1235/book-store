import 'package:book_store/config/const.dart';
import 'package:book_store/config/routes.dart';
import 'package:book_store/feature/homepage/presentation/bloc/home_bloc.dart';
import 'package:book_store/feature/homepage/presentation/bloc/home_event.dart';
import 'package:book_store/feature/homepage/presentation/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookListScreen extends StatelessWidget {
  const BookListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConst.homePageTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.favorites),
          ),
        ],
      ),
      body: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: AppConst.hintSearch,
                  ),
                  onChanged:
                      (value) =>
                          context.read<BookBloc>().add(LoadBooks(query: value)),
                ),
              ),
              Expanded(
                child: BlocBuilder<BookBloc, BookState>(
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is FailureState) {
                      return Center(
                        child: Text(AppConst.msgSomethingWentWrong),
                      );
                    }
                    if (state is GetBooksSuccessState) {
                      return ListView.builder(
                        itemCount: state.books!.length,
                        itemBuilder: (context, index) {
                          final book = state.books![index];
                          return ListTile(
                            leading: Image.network(book.imageUrl, width: 50),
                            title: Text(book.title),
                            subtitle: Text(book.author),
                            trailing: IconButton(
                              icon: Icon(
                                book.isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                              ),
                              onPressed:
                                  () => context.read<BookBloc>().add(
                                    ToggleFavorite(book.id),
                                  ),
                            ),
                          );
                        },
                      );
                    }
                    return SizedBox();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
