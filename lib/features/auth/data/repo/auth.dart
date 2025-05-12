import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/network/api_helper.dart';
import '../../../../core/network/end_points.dart';

class AuthRepo {
  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, void>> register({
    required String username,
    required String password,
  }) async {
    try {
      await apiHelper.postRequest(
        endPoint: EndPoints.register,
        data: {'username': username, 'password': password},
      );
      return Right(null);
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response?.data['message'] != null) {
          return Left(e.response?.data['message']);
        }
      }

      print("Error ${e.toString()}");
      return Left(e.toString());
    }
  }

  Future<Either<String, void>> login({
    required String username,
    required String password,
  }) async {
    try {
      await apiHelper.postRequest(
        endPoint: EndPoints.login,
        data: {'username': username, 'password': password},
      );
      return Right(null);
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response?.data['message'] != null) {
          return Left(e.response?.data['message']);
        }
      }

      print("Error ${e.toString()}");
      return Left(e.toString());
    }
  }
}
