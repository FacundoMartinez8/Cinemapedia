import 'package:cinemapedia/core/failures/failure.dart';
import 'package:dartz/dartz.dart';

/// Autogenerated Code
/// Don't touch!
abstract class UseCaseBase<T1, T2> {
  Future<Either<Failure, T1>> call(T2 params);
}
