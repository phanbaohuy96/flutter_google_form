part of '../base.dart';

abstract class StateBase<T extends StatefulWidget> extends CoreStateBase<T> {
  LocalDataManager get localDataManager => injector.get();

  @override
  String get languageCode =>
      context.read<AppGlobalBloc>().state.locale.languageCode;

  @override
  void showLoginNoticeDialog({
    required Function() onSuccess,
    Function()? onSkip,
  }) {
    final trans = translate(context);
    showNoticeConfirmDialog(
      context: context,
      message: trans.loginRequired,
      title: trans.inform,
      rightBtn: trans.login,
      leftBtn: trans.skip,
      onConfirmed: () {
        backToAuth(onSuccess: onSuccess, onSkip: onSkip);
      },
    );
  }

  @override
  void backToAuth({
    Function()? onSuccess,
    Function()? onSkip,
  }) {
    // Navigator.pushNamed(context, RouteList.signin).then((value) {
    //   if (value is bool && value) {
    //     onSuccess?.call();
    //   } else {
    //     onSkip?.call();
    //   }
    // });
  }

  @override
  Future<void> doLogout() async {
    showLoading();
    return super.doLogout();
  }
}
