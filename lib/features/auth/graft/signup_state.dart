import 'package:graft/graft.dart';

/// Domain state for user account registration.
///
/// Uses Frame-0 dry persistence via [onDry] so that user draft inputs
/// survive app restarts, background app kills, and terms/privacy navigation.
class SignUpState extends GraftState {
  String username = '';
  String email = '';
  String phoneNumber = '';
  String dateOfBirth = '';
  bool isLoading = false;

  /// Prefix key matching [AppScope.signup] so [AppScope.signup.invalidateDry()]
  /// purges this draft state upon successful account creation.
  @override
  String get dryKey => 'signup_draft';

  /// Persists draft registration fields across app restarts.
  /// Transient [isLoading] is omitted to always start fresh.
  @override
  void onDry() {
    username = dry(username);
    email = dry(email);
    phoneNumber = dry(phoneNumber);
    dateOfBirth = dry(dateOfBirth);
  }

  @override
  GraftProps get props => propsOf(
        username,
        email,
        phoneNumber,
        dateOfBirth,
        isLoading,
      );
}
