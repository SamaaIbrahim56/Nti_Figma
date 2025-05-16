import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nti_figma/core/network/api_helper.dart';
import 'package:nti_figma/features/change_password/data/change_password_repo/change_password_repo.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/end_points.dart';
import '../../../../core/network/response_model.dart';

class ChangePasswordRepoImple implements ChangePasswordRepo {
  ApiHelper apiHelper = ApiHelper();

  ChangePasswordRepoImple( );
  @override
  Future<Either<String, ResponseModel>> changePassword(
      {required String oldPassword,required String confirmNewPassword,required String newPassword}) async {
    try {
      ApiResponse response = await apiHelper.postRequest(endPoint: EndPoints.changePassword,isProtected: true,data: {'current_password': oldPassword, 'new_password': newPassword,'new_password_confirm':confirmNewPassword});
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