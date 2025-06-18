import 'package:book_store/config/failure_model.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params> {
  Future<Either<FailureModel, Type>> call(Params params);
}

class NoParams {}
