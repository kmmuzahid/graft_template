import 'package:graft/graft.dart';

class TaskItem {
  final String id;
  final String title;
  final String category;
  final bool isDone;

  const TaskItem({
    required this.id,
    required this.title,
    required this.category,
    this.isDone = false,
  });

  TaskItem copyWith({bool? isDone}) {
    return TaskItem(
      id: id,
      title: title,
      category: category,
      isDone: isDone ?? this.isDone,
    );
  }
}

class TaskCatalogState extends GraftState {
  List<TaskItem> tasks;

  TaskCatalogState({required this.tasks});

  @override
  GraftProps get props => propsOf(tasks);
}

class TaskCatalogGraft extends Graft<TaskCatalogState> {
  TaskCatalogGraft()
      : super(
          TaskCatalogState(
            tasks: [
              const TaskItem(id: '1', title: 'Setup Graft Route Observer', category: 'Architecture', isDone: true),
              const TaskItem(id: '2', title: 'Eliminate SafeCubit & SafeBloc', category: 'Refactor', isDone: true),
              const TaskItem(id: '3', title: 'Benchmark Multi-Child Slot Diffing', category: 'Performance', isDone: false),
              const TaskItem(id: '4', title: 'Configure custom_lint with graft_lint', category: 'Tooling', isDone: true),
              const TaskItem(id: '5', title: 'Profile 1000 items virtualization', category: 'Performance', isDone: false),
              const TaskItem(id: '6', title: 'Export clean production bundle', category: 'Release', isDone: false),
            ],
          ),
        );

  void toggleTask(String id) {
    state
      ..tasks = state.tasks.map((task) {
        if (task.id == id) {
          return task.copyWith(isDone: !task.isDone);
        }
        return task;
      }).toList()
      ..update();
  }

  void markAllCompleted() {
    state
      ..tasks = state.tasks.map((t) => t.copyWith(isDone: true)).toList()
      ..update();
  }

  void addNewTask(String title) {
    final newItem = TaskItem(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      category: 'User Task',
      isDone: false,
    );
    state
      ..tasks = [...state.tasks, newItem]
      ..update();
  }
}
