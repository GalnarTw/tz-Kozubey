import 'package:dartz/dartz.dart';
import '../data/model.dart';
import '/first/domain/errors.dart';

abstract class ThreeRepository {
  Future<Either<Failure, List<ThreeModel>>> searchThree();
}