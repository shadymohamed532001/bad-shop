import 'package:dartz/dartz.dart';

abstract class AuthuseCase<type, para, num> {
  Future<Either<Error, type>> call([para param]);
}
