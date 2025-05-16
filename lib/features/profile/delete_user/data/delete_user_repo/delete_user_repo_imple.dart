

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/network/api_helper.dart';
import '../../../../../core/network/api_response.dart';
import '../../../../../core/network/end_points.dart';
import '../../../../../core/network/response_model.dart';
import 'delete_user_repo.dart';

class DeleteUserRepoImple implements DeleteUserRepo {
  ApiHelper apiHelper = ApiHelper();

  DeleteUserRepoImple( );
  @override
  Future<Either<String, ResponseModel>> deleteUser() async {
    try {
      ApiResponse response = await apiHelper.deleteRequest(endPoint: EndPoints.deleteUser,isProtected: true,data: null,);
      ResponseModel responseModel = ResponseModel.fromJson(response.data);
      if(response.status && response.status == true)
      {
        return Right(responseModel);
      }
      else
      {
        throw Exception("Something went wrong");
      }



    } catch (e) {
      if(e is DioException)
      {
        if(e.response != null && e.response?.data['message'] != null) {
          return Left(e.response?.data['message']);
        }
      }

      print("Error ${e.toString()}");
      return Left(e.toString());
    }

  }
}