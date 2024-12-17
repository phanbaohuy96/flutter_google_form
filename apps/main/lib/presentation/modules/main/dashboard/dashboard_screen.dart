import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../l10n/generated/app_localizations.dart';
import '../../../base/base.dart';
import '../../../extentions/extention.dart';
import '../../form/form.dart';
import 'cubit/dashboard_cubit.dart';
import 'dashboard_constants.dart';

part 'dashboard.action.dart';

class DashboardScreen extends StatefulWidget {
  static String routeName = '/dashboard';

  DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends StateBase<DashboardScreen>
    with AfterLayoutMixin, WidgetsBindingObserver {
  DashboardCubit get _cubit => BlocProvider.of(context);

  final _pageController = PageController();

  @override
  void afterFirstLayout(BuildContext context) {
    themeColor.setLightStatusBar();
    _cubit
      ..navigateTo(DashboardPage.home.index)
      ..markLaunched();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );

    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _didChangeAppLifecycleState(state);
  }

  late ThemeData _themeData;

  TextTheme get textTheme => _themeData.textTheme;

  late AppLocalizations trans;

  @override
  Widget build(BuildContext context) {
    _themeData = context.theme;
    trans = translate(context);
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom + 65,
            ),
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: [
                /// home page
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ThemeButton.primary(
                        title: trans.createForm,
                        onPressed: context.goToUpsertForm,
                      ),
                      const SizedBox(height: 16),
                      ThemeButton.primary(
                        title: trans.formListing,
                        onPressed: context.goToFormListing,
                      ),
                    ],
                  ),
                ),
                const SizedBox(),
              ],
            ),
          ),
          BlocConsumer<DashboardCubit, DashboardState>(
            listener: _cubitListener,
            bloc: _cubit,
            builder: (context, state) => CustomBottomNavigationBar(
              items: [
                BottomBarItemData(
                  label: trans.homepage,
                  icon: Icons.home,
                ),
                BottomBarItemData(
                  label: trans.accountPage,
                  icon: Icons.person,
                ),
              ],
              selectedIdx: state.index,
              onItemSelection: onNavigationPressed,
            ),
          ),
        ],
      ),
    );
  }

  @override
  CoreBlocBase? get bloc => null;
}
