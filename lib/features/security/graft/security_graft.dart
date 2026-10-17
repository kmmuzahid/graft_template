import 'package:graft/graft.dart';

class SecurityState extends GraftState {
  bool twoFactorAuth;
  int keyRotationDays;
  bool biometricLock;

  SecurityState({
    this.twoFactorAuth = true,
    this.keyRotationDays = 30,
    this.biometricLock = true,
  });

  @override
  GraftProps get props => propsOf(twoFactorAuth, keyRotationDays, biometricLock);
}

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

class LiveCounterState extends GraftState {
  int count;

  LiveCounterState({this.count = 0});

  @override
  GraftProps get props => propsOf(count);
}

class LiveCounterGraft extends Graft<LiveCounterState> {
  LiveCounterGraft() : super(LiveCounterState());

  void increment() {
    state
      ..count += 1
      ..update();
  }
}
