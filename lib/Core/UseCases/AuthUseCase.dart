// ignore_for_file: camel_case_types

import 'package:dartz/dartz.dart';

abstract class authuseCase<type, para, num> {
  Future<Either<Error, type>> Call([para param]);
}
