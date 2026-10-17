import 'package:graft/graft.dart';

class SplashState extends GraftState {
  bool isLoading;

  SplashState({this.isLoading = true});

  @override
  GraftProps get props => propsOf(isLoading);
}
