import 'package:book_store/config/const.dart';
import 'package:book_store/feature/homepage/domain/entity/book_entity.dart';
import 'package:book_store/feature/homepage/presentation/bloc/home_bloc.dart';
import 'package:book_store/feature/homepage/presentation/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Book> favBooks = [];
  @override
  void initState() {
    favBooks = context.read<BookBloc>().favBooks;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppConst.favPageTitle)),
      body: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          return favBooks.isEmpty
              ? const Center(child: Text(AppConst.msgNoFavYet))
              : ListView.builder(
                itemCount: favBooks.length,
                itemBuilder: (context, index) {
                  final book = favBooks[index];
                  return ListTile(
                    leading: Image.network(book.imageUrl, width: 50),
                    title: Text(book.title),
                    subtitle: Text(book.author),
                  );
                },
              );
        },
      ),
    );
  }
}
