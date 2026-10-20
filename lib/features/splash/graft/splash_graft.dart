import 'package:graft/graft.dart';
import 'splash_state.dart';

export 'splash_state.dart';

class SplashGraft extends Graft<SplashState> {
  SplashGraft() : super(SplashState());

  @override
  void onInit() {
    super.onInit();
    init();
  }

  Future<void> init() async {
    state
      ..isLoading = true
      ..update();
    await Future.delayed(const Duration(seconds: 2));
    if (!isDisposed) {
      state
        ..isLoading = false
        ..update();
    }
  }
}
