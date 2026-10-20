import 'package:graft/graft.dart';
import 'package:graft_template/config/dependency/dependency_injection.dart';
import 'signup_state.dart';

export 'signup_state.dart';

/// Business logic controller for user registration.
///
/// Managed under [AppScope.signup] with Frame-0 dry persistence.
/// Controllers auto-dispose automatically when the screen unmounts.
class SignUpGraft extends Graft<SignUpState> {
  SignUpGraft() : super.dry(SignUpState.new);

  /// Synchronously updates registration fields and triggers surgical slot diffing.
  void updateField({
    String? username,
    String? email,
    String? phoneNumber,
    String? dateOfBirth,
  }) {
    state
      ..username = username ?? state.username
      ..email = email ?? state.email
      ..phoneNumber = phoneNumber ?? state.phoneNumber
      ..dateOfBirth = dateOfBirth ?? state.dateOfBirth
      ..update();
  }

  void setLoading(bool loading) {
    state
      ..isLoading = loading
      ..update();
  }

  /// Purges persisted draft data using the signup scope upon successful registration.
  /// (The scope itself auto-disposes controllers when the route unmounts).
  void onSignUpSuccess() {
    AppScope.signup.invalidateDry();
  }
}
