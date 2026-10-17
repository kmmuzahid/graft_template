import 'package:graft/graft.dart';
import 'security_state.dart';

export 'security_state.dart';

class SecurityGraft extends Graft<SecurityState> {
  SecurityGraft() : super(SecurityState());

  void toggle2FA() {
    state
      ..twoFactorAuth = !state.twoFactorAuth
      ..update();
  }

  void toggleBiometrics() {
    state
      ..biometricLock = !state.biometricLock
      ..update();
  }

  void rotateKeys() {
    state
      ..keyRotationDays = 90
      ..update();
  }
}

class LiveCounterGraft extends Graft<LiveCounterState> {
  LiveCounterGraft() : super(LiveCounterState());

  void increment() {
    state
      ..count += 1
      ..update();
  }
}
