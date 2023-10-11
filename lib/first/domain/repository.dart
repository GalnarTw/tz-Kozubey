import 'package:dartz/dartz.dart';
import '/first/data/model.dart';
import '/first/domain/errors.dart';

abstract class FirstRepository {
  Future<Either<Failure, List<FirstModel>>> searchFirst();
}