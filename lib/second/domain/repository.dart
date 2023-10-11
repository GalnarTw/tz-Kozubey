import 'package:dartz/dartz.dart';
import '../data/model.dart';
import '/first/domain/errors.dart';

abstract class SecondRepository {
  Future<Either<Failure, List<SecondModel>>> searchSecond();
}