// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class AuthRepo {
  Future<Either<Error, Response>> LoginUser(
      {required String email, required num password});
  Future<Either<Error, Response>> RegisterUser();
}
