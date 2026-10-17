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

typedef TaskModel = TaskItem;
