import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nti_figma/core/network/api_helper.dart';
import 'package:nti_figma/features/update_profile/data/repo/update_profile_repo.dart';

import '../../../../core/network/api_response.dart';
import '../../../../core/network/end_points.dart';
import '../../../../core/network/response_model.dart';

class UpdateRepoImple implements UpdateRepo {
  ApiHelper apiHelper = ApiHelper();

  UpdateRepoImple( );
  @override
  Future<Either<String, ResponseModel>> updateProfile(
      {required String userName, required XFile? image}) async {
    try {
      ApiResponse response = await apiHelper
          .putRequest( data: {'username': userName, 'image': image},isProtected: true, endPoint: EndPoints.updateProfile);
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