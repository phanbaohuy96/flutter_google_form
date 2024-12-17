part of 'splash_screen.dart';

extension SplashAction on _SplashScreenState {
  void initial() {
    bloc.add(SplashInitialEvent());
  }

  void _blocListener(_, SplashState state) {
    if (state is SplashFinishState) {
      final nextScreen = state.nextScreen;
      _launchApp(nextScreen);
    }
  }

  void _launchApp(String route) {
    removeNativeSplashScreen(shouldDelay: Platform.isAndroid);
    Navigator.pushNamedAndRemoveUntil(
      context,
      route,
      (route) => false,
    );
  }

  void removeNativeSplashScreen({bool shouldDelay = true}) {
    Future.delayed(
      Duration(
        milliseconds: shouldDelay ? 1000 : 50,
      ),
    ).then(
      (_) => FlutterNativeSplash.remove(),
    );
  }
}
