part of 'dashboard_cubit.dart';

abstract class DashboardState {
  final int index;

  // True => status bar color is white
  // False => status bar color is black
  bool get lighStatusBar;

  String get route;

  DashboardState(this.index);
}

class DashboardHome extends DashboardState {
  DashboardHome() : super(DashboardPage.home.index);

  @override
  bool get lighStatusBar => true;

  @override
  String get route => 'home';
}

class DashboardAccount extends DashboardState {
  DashboardAccount() : super(DashboardPage.account.index);
  @override
  bool get lighStatusBar => true;

  @override
  String get route => 'account';
}
