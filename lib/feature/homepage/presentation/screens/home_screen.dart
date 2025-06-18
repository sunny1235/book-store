import 'package:book_store/config/const.dart';
import 'package:book_store/config/routes.dart';
import 'package:book_store/di/di.dart';
import 'package:book_store/feature/homepage/presentation/bloc/home_bloc.dart';
import 'package:book_store/feature/homepage/presentation/bloc/home_event.dart';
import 'package:book_store/feature/homepage/presentation/screens/book_list_screen.dart';
import 'package:book_store/feature/homepage/presentation/screens/fav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<BookBloc>()..add(LoadBooks()),
      child: MaterialApp(
        title: AppConst.appTitle,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const BookListScreen(),
        routes: {AppRoutes.favorites: (context) => const FavoritesScreen()},
      ),
    );
  }
}
