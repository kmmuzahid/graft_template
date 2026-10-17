import 'package:graft/graft.dart';

class ProfileState extends GraftState {
  String name;
  String email;
  bool isVerified;
  bool biometricAuth;

  ProfileState({
    this.name = 'Km Muzahid',
    this.email = 'km.muzahid@gmail.com',
    this.isVerified = true,
    this.biometricAuth = false,
  });

  @override
  GraftProps get props => propsOf(name, email, isVerified, biometricAuth);
}

class ProfileGraft extends Graft<ProfileState> {
  ProfileGraft() : super(ProfileState());

  void updateName(String newName) {
    state
      ..name = newName
      ..update();
  }

  void updateEmail(String newEmail) {
    state
      ..email = newEmail
      ..update();
  }

  void toggleVerified() {
    state
      ..isVerified = !state.isVerified
      ..update();
  }

  void toggleBiometrics() {
    state
      ..biometricAuth = !state.biometricAuth
      ..update();
  }
}
