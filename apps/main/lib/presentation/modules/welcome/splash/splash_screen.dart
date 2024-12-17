import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../../../generated/assets.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../base/base.dart';
import '../../../extentions/extention.dart';
import 'bloc/splash_bloc.dart';

part 'splash_action.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/splash_screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends StateBase<SplashScreen> {
  late AppLocalizations trans;

  @override
  void initState() {
    initial();
    super.initState();
  }

  @override
  SplashBloc get bloc => BlocProvider.of<SplashBloc>(context);

  late ThemeData _themeData;

  TextTheme get textTheme => _themeData.textTheme;

  @override
  void onCloseErrorDialog() {
    bloc.add(SplashInitialEvent());
    super.onCloseErrorDialog();
  }

  @override
  void hideLoading() {
    removeNativeSplashScreen(shouldDelay: false);
    super.hideLoading();
  }

  @override
  void showLoginRequired({
    String? message,
    Function()? onConfirmed,
  }) {
    showNoticeConfirmDialog(
      barrierDismissible: true,
      context: context,
      title: trans.inform,
      message: message ?? trans.sessionExpired,
      onConfirmed: () {
        doLogout().then((_) async {
          await bloc.localDataManager.unMarkLaunched();
          onCloseErrorDialog();
        });
      },
      onCanceled: () {
        doLogout().then((value) {
          onCloseErrorDialog();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _themeData = context.theme;
    trans = translate(context);

    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        listener: _blocListener,
        child: Center(
          child: ImageView(
            source: Assets.image.icFlutter,
            fit: BoxFit.fitWidth,
            width: MediaQuery.of(context).size.width * 0.65,
          ),
        ),
      ),
    );
  }
}
