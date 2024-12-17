part of 'dashboard_screen.dart';

extension DashboardAction on _DashboardScreenState {
  Future<bool> onNavigationPressed(int idx) async {
    _cubit.navigateTo(idx);
    return true;
  }

  void _didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      themeColor.setLightStatusBar();
    }
  }

  void _cubitListener(BuildContext context, DashboardState state) {
    if (state.lighStatusBar) {
      themeColor.setLightStatusBar();
    } else {
      themeColor.setDarkStatusBar();
    }
    _pageController.jumpToPage(
      state.index,
    );
  }
}
