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

class DashboardGraft extends Graft<DashboardState> {
  DashboardGraft() : super(DashboardState());

  void incrementNotifications() {
    state
      ..notifications += 1
      ..update();
  }

  void completeNextTask() {
    if (state.completedTasks < state.totalTasks) {
      state
        ..completedTasks += 1
        ..update();
    }
  }

  void resetMetrics() {
    state
      ..completedTasks = 0
      ..notifications = 0
      ..update();
  }

  Future<void> syncData() async {
    state
      ..isSyncing = true
      ..update();
    await Future.delayed(const Duration(milliseconds: 1200));
    state
      ..isSyncing = false
      ..totalTasks += 2
      ..update();
  }
}
