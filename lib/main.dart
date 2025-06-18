import 'package:book_store/di/di.dart';
import 'package:flutter/material.dart';
import 'package:book_store/feature/homepage/presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const HomeScreen());
}