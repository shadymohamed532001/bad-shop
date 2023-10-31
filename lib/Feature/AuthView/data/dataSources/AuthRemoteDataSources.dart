// // ignore_for_file: non_constant_identifier_names

// import 'package:bag/Core/Uitls/ApiServices.dart';
// import 'package:bag/Core/Uitls/endBoint.dart';
// import 'package:dio/dio.dart';

// abstract class AuthDataSources {
//   Future<Response> LoginUser({
//     required String email,
//     required num password,
//   });
//   Future<Response> RegisterUser(
//          { required String name,

//       required String email,
//           required num password,

//     required num phone,}

//   );
// }

// class AuthRemoteDataSorcesImpl extends AuthDataSources {
//   final ApiServices apiServices;

//   AuthRemoteDataSorcesImpl({required this.apiServices});

//   @override
//   Future<Response> LoginUser({required String email, required num password})async {
//      return await apiServices.PostData(endpoint: Loginendpoint, data: {
//       'email':email ,
//       'password': password,
//     });
//   }

//   @override
//   Future<Response> RegisterUser({required String name, required String email, required num password, required num phone}) {
//     // TODO: implement RegisterUser
//     throw UnimplementedError();
//   }

// }
