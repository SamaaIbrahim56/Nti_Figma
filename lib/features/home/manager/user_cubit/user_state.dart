import 'package:nti_figma/features/home/data/models/user_model.dart';

abstract class UserState{}
class UserInitState extends UserState{}
class UserSuccess extends UserState{
  UserModel userModel;

  UserSuccess({required this.userModel});
}