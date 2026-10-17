import 'package:graft/graft.dart';

class SplashState extends GraftState {
  bool isLoading;

  SplashState({this.isLoading = true});

  @override
  GraftProps get props => propsOf(isLoading);
}

class SplashGraft extends Graft<SplashState> {
  SplashGraft() : super(SplashState());

  Future<void> init() async {
    state
      ..isLoading = true
      ..update();
    await Future.delayed(const Duration(seconds: 2));
    state
      ..isLoading = false
      ..update();
  }
}
