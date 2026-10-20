import 'package:flutter_test/flutter_test.dart';
import 'package:graft/graft.dart';
import 'package:graft_template/config/dependency/dependency_injection.dart';
import 'package:graft_template/features/auth/graft/signup_graft.dart';

void main() {
  setUp(() {
    configurePersistence(MemoryStateConfig());
    GraftDI.reset();
    configureDependencies();
  });

  tearDown(() {
    GraftDI.reset();
  });

  test('SignUpGraft dry state persists fields and invalidates via AppScope.signup', () {
    // 1. Instantiate SignUpGraft
    final graft = SignUpGraft();

    // 2. Update registration fields
    graft.updateField(
      username: 'alice_dev',
      email: 'alice@example.com',
      phoneNumber: '+1234567890',
      dateOfBirth: '1995-05-15',
    );

    expect(graft.state.username, equals('alice_dev'));
    expect(graft.state.email, equals('alice@example.com'));
    expect(graft.state.phoneNumber, equals('+1234567890'));
    expect(graft.state.dateOfBirth, equals('1995-05-15'));

    // 3. Complete signup -> invalidates dry state via AppScope.signup
    graft.onSignUpSuccess();
  });
}
