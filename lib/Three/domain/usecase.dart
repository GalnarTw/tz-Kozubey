import 'package:dartz/dartz.dart';
import '/first/domain/errors.dart';
abstract class Usecase<Type> {
  Future<Either<Failure, Type>> call();
}