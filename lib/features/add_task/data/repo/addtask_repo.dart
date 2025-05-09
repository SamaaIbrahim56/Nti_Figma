import '../models/task_model.dart';

class AddTaskRepo{
   List<TaskModel>_tasks=[];
  void addTask(TaskModel task){
    _tasks.add(task);
  }
   List<TaskModel> getTasks() {
     return _tasks;
   }
}