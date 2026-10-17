import 'package:graft/graft.dart';

class DashboardState extends GraftState {
  int totalTasks;
  int completedTasks;
  int notifications;
  int activeSessions;
  bool isSyncing;

  DashboardState({
    this.totalTasks = 24,
    this.completedTasks = 18,
    this.notifications = 3,
    this.activeSessions = 2,
    this.isSyncing = false,
  });

  double get completionRatio =>
      totalTasks == 0 ? 0.0 : (completedTasks / totalTasks);

  @override
  GraftProps get props => propsOf(
        totalTasks,
        completedTasks,
        notifications,
        activeSessions,
        isSyncing,
      );
}
