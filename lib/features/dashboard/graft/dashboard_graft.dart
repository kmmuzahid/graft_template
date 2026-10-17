import 'package:graft/graft.dart';
import 'dashboard_state.dart';

export 'dashboard_state.dart';

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
