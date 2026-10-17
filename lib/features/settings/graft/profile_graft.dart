import 'package:graft/graft.dart';
import 'profile_state.dart';

export 'profile_state.dart';

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
