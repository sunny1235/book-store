

import 'package:book_store/config/base_usecase.dart';
import 'package:book_store/config/failure_model.dart';
import 'package:book_store/feature/homepage/data/model/book_model.dart';
import 'package:book_store/feature/homepage/domain/repository/get_books_repo.dart';
import 'package:book_store/feature/homepage/domain/usecase/get_books_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_books_usecase_test.mocks.dart';




@GenerateMocks([BookRepository])
void main() {
  test('GetBooksUseCase returns books from repository', () async {
    final mockRepo = MockBookRepository();
    final useCase = GetBooksUseCase(repository: mockRepo);
    final books = [BookModel(id: '1', title: 'Test', author: 'Author', imageUrl: 'url')];

    when(mockRepo.getBooks()).thenAnswer((_) async => Right(books));

    final result = await useCase.call(NoParams());

    expect(result.isRight(), true);
    expect(result.getOrElse(() => []), books);
  });


  test('GetBooksUseCase returns Failure from repository', () async {
    final mockRepo = MockBookRepository();
    final useCase = GetBooksUseCase(repository: mockRepo);
    final failure = FailureModel();

    when(mockRepo.getBooks()).thenAnswer((_) async => Left(failure));

    final result = await useCase.call(NoParams());

    expect(result.isLeft(), true);
    expect(result.fold((l)=> l, (r)=>r),failure);
  });
}