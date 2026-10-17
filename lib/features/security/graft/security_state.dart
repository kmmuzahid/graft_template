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

class LiveCounterState extends GraftState {
  int count;

  LiveCounterState({this.count = 0});

  @override
  GraftProps get props => propsOf(count);
}
