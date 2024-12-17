import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../core.dart';
import '../../../di/core_micro.dart';
import '../../../l10n/localization_ext.dart';

part 'state_base.error_handler.dart';
part 'state_base.ext.dart';

abstract class CoreStateBase<T extends StatefulWidget> extends State<T> {
  ErrorType? errorTypeShowing;

  String get languageCode =>
      context.read<AppGlobalBloc>().state.locale.languageCode;

  bool get isLoading => EasyLoading.isShow;

  CoreBlocBase? get bloc => null;

  List<CoreBlocBase> get subBlocs => [];

  bool get willHandleError => true;

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    logUtils.d('[${T.toString()}] initState');
    if (willHandleError) {
      bloc?.addErrorHandler(onError);
    }
    for (final bl in subBlocs) {
      bl.addErrorHandler(onError);
    }
  }

  @override
  @mustCallSuper
  void didChangeDependencies() {
    ClientInfo.languageCode = languageCode;
    super.didChangeDependencies();
  }

  @override
  @mustCallSuper
  void dispose() {
    logUtils.d('[${T.toString()}] dispose');
    super.dispose();
  }

  void showLoading({bool? dismissOnTap}) {
    if (!EasyLoading.isShow) {
      EasyLoading.show(
        status: coreL10n.loading,
        indicator: const Loading(
          brightness: Brightness.dark,
        ),
        dismissOnTap: dismissOnTap ?? kDebugMode,
        maskType: EasyLoadingMaskType.clear,
      );
    }
  }

  void hideLoading() {
    if (EasyLoading.isShow) {
      EasyLoading.dismiss();
    }
  }

  void onError(ErrorData err) {
    var error = err;
    if (error.origin == ErrorOrigin.firebase && error.errorCode != null) {
      final firebaseAuthExceptionType =
          FirebaseAuthExceptionTypeExt.fromString(error.errorCode!);

      error = error.copyWith(
        //Get localized message, if it's null take the original
        message: firebaseAuthExceptionType?.localizedErrorMessage(
          context,
        ),
      );
    }

    hideLoading();
    _onError(error);
  }

  void showLoginNoticeDialog({
    required Function() onSuccess,
    Function()? onSkip,
  }) {}

  void backToAuth({
    Function()? onSuccess,
    Function()? onSkip,
  }) {}

  void showErrorDialog(String? message, {Function()? onClose}) {
    showNoticeErrorDialog(
      context: context,
      message:
          message?.isNotEmpty != true ? coreL10n.technicalIssues : message!,
      onClose: () {
        onCloseErrorDialog();
        onClose?.call();
      },
    );
  }

  @mustCallSuper
  void onCloseErrorDialog() {
    errorTypeShowing = null;
  }

  void showLoginRequired({String? message, Function()? onConfirmed}) {
    showNoticeConfirmDialog(
      barrierDismissible: true,
      context: context,
      title: coreL10n.inform,
      message: message ?? coreL10n.sessionExpired,
      onConfirmed: () {
        onCloseErrorDialog();
        if (onConfirmed != null) {
          onConfirmed.call();
        }
      },
      onCanceled: onCloseErrorDialog,
    );
  }

  void showNoInternetDialog() {
    showNoticeDialog(
      context: context,
      message: coreL10n.noInternet,
      onClose: onCloseErrorDialog,
    );
  }

  void onLogicError(String? message) {
    showErrorDialog(message);
  }

  Widget baseLoading() {
    return const Loading();
  }

  Future<void> doLogout() async {
    logUtils.i('doLogout');
    showLoading();
    await Future.wait(
      [
        injector.get<CoreLocalDataManager>().clearData(),
      ],
    );
    hideLoading();
  }

  Future showFlushBar({
    String? title,
    String? message,
    Widget? icon,
    Duration duration = const Duration(seconds: 1),
    Color backgroundColor = Colors.black87,
    FlushbarPosition flushbarPosition = FlushbarPosition.TOP,
    EdgeInsets margin = const EdgeInsets.symmetric(horizontal: 24),
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(24)),
    EdgeInsets padding = const EdgeInsets.symmetric(
      vertical: 12,
      horizontal: 12,
    ),
  }) {
    return Flushbar(
      title: title,
      message: message,
      duration: duration,
      backgroundColor: backgroundColor,
      flushbarPosition: flushbarPosition,
      margin: margin,
      borderRadius: borderRadius,
      padding: padding,
      icon: icon,
      flushbarStyle: FlushbarStyle.FLOATING,
    ).show(context);
  }
}
