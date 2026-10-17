import 'package:graft/graft.dart';
import 'package:graft_template/features/tasks/model/task_model.dart';

export 'package:graft_template/features/tasks/model/task_model.dart';

class TaskCatalogState extends GraftState {
  List<TaskItem> tasks;

  TaskCatalogState({required this.tasks});

  @override
  GraftProps get props => propsOf(tasks);
}
