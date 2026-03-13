import 'package:dartz/dartz.dart';
import 'package:zyntra/core/errors/failure.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call([Params params]);
}

// we can add any logic here before fetching the data from the repo
// for example we can check if the data is already cached and return it instead of fetching it again from the repo
// for example we can check the internet connection before fetching the data from the repo
