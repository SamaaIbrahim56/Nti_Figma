import 'package:dartz/dartz.dart';

import '../../../../../core/network/response_model.dart';

abstract class DeleteUserRepo {
  Future<Either<String,ResponseModel>> deleteUser(
  );
}