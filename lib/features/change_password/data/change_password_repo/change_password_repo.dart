import 'package:dartz/dartz.dart';

import '../../../../core/network/response_model.dart';

abstract class ChangePasswordRepo {
  Future<Either<String,ResponseModel>> changePassword({required String oldPassword,required String confirmNewPassword,required String newPassword});
}