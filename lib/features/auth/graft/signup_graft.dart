import 'package:graft/graft.dart';
import 'package:graft_template/config/dependency/app_scope.dart';
import 'signup_state.dart';

export 'signup_state.dart';

/// Business logic controller for user registration.
///
/// Registered under [AppScope.signup] with Frame-0 dry persistence.
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

  /// Purges persisted draft data and drops the [AppScope.signup] scope upon completion.
  void onSignUpSuccess() {
    // 1. Invalidate Frame-0 persisted storage (clears draft from SharedPreferences)
    invalidateDry();

    // 2. Drop the signup scope and dispose scoped controllers
    AppScope.signup.drop();
  }
}
