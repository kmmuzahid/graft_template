import 'package:graft/graft.dart';

/// Domain state for user account registration.
///
/// Uses Frame-0 dry persistence via constructor tear-off so that user draft inputs
/// survive app restarts, background app kills, and terms/privacy navigation.
class SignUpState extends GraftState {
  @override
  int get schemaVersion => 1;

  String username;
  String email;
  String phoneNumber;
  String dateOfBirth;
  bool isLoading;

  SignUpState([
    this.username = '',
    this.email = '',
    this.phoneNumber = '',
    this.dateOfBirth = '',
    this.isLoading = false,
  ]);

  /// Prefix key matching [AppScope.signup] so [AppScope.signup.invalidateDry()]
  /// purges this draft state upon successful account creation.
  @override
  String get dryKey => 'signup_draft';

  @override
  GraftProps get props => propsOf(
        username,
        email,
        phoneNumber,
        dateOfBirth,
        isLoading,
      );
}
