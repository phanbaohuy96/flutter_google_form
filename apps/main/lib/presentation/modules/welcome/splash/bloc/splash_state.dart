part of 'splash_bloc.dart';

abstract class SplashState {
  final String? nextScreen;

  SplashState(this.nextScreen);
}

class SplashInitialState extends SplashState {
  SplashInitialState() : super(null);
}

class SplashFinishState extends SplashState {
  @override
  final String nextScreen;

  SplashFinishState(this.nextScreen) : super(nextScreen);
}
