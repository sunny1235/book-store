import 'dart:convert';

import 'package:book_store/config/failure_model.dart';
import 'package:book_store/feature/homepage/data/model/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

class BookLocalDataSource {
  Future<Either<FailureModel, List<BookModel>>> getBooks() async {
    final String response = await rootBundle.loadString('assets/books.json');
    final List<dynamic> data = json.decode(response);
    if(data.isNotEmpty){
     return Right(data.map((e) => BookModel.fromJson(e)).toList());
    }else{
      return Left(FailureModel());
    }
  }
}