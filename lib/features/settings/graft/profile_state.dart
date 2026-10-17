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
