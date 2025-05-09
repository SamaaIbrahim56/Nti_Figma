abstract class AddTaskState {}

class AddTaskInitState extends AddTaskState {}

class AddTaskLoadingState extends AddTaskState {}

class AddTaskSuccessState extends AddTaskState {}

class AddTaskErrorState extends AddTaskState {
  final String error;
  AddTaskErrorState(this.error);
}
