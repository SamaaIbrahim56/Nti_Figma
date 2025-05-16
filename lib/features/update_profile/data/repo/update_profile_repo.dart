import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/network/response_model.dart';

abstract class UpdateRepo {
  Future<Either<String,ResponseModel>> updateProfile({required String userName, required XFile image});
}