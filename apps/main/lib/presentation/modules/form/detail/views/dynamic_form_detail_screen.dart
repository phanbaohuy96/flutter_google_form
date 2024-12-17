import 'package:core/core.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

import '../../../../../data/models/form.dart';
import '../../../../../l10n/generated/app_localizations.dart';
import '../../../../base/base.dart';
import '../../../../extentions/extention.dart';
import '../bloc/dynamic_form_detail_bloc.dart';
import 'pages/form_question_page.dart';
import 'pages/form_response_page.dart';

part 'dynamic_form_detail.action.dart';

class DynamicFormDetailArgs {
  final DynamicForm? initial;
  final String? id;

  DynamicFormDetailArgs({this.initial, this.id});
}

class DynamicFormDetailScreen extends StatefulWidget {
  static String routeName = '/dynamic_form_detail';

  const DynamicFormDetailScreen({Key? key, this.args}) : super(key: key);

  final DynamicFormDetailArgs? args;

  @override
  State<DynamicFormDetailScreen> createState() =>
      DynamicFormDetailScreenState();
}

class DynamicFormDetailScreenState extends StateBase<DynamicFormDetailScreen> {
  final _refreshController = RefreshController(initialRefresh: true);
  final detailPageController = RefreshController(initialRefresh: false);
  final responsePageController = RefreshController(initialRefresh: false);

  final _pageController = PageController();
  final _pageIdxValue = ValueNotifier<int>(0);

  @override
  DynamicFormDetailBloc get bloc => BlocProvider.of(context);

  late ThemeData _themeData;

  TextTheme get textTheme => _themeData.textTheme;

  late AppLocalizations trans;

  @override
  void hideLoading() {
    _refreshController
      ..refreshCompleted()
      ..loadComplete();
    detailPageController
      ..refreshCompleted()
      ..loadComplete();
    responsePageController
      ..refreshCompleted()
      ..loadComplete();
    super.hideLoading();
  }

  @override
  Widget build(BuildContext context) {
    _themeData = context.theme;
    trans = translate(context);
    return DynamicFormDetailScreenInherited(
      state: this,
      child: BlocConsumer<DynamicFormDetailBloc, DynamicFormDetailState>(
        listener: _blocListener,
        builder: (context, state) {
          return ScreenForm(
            title: state.data?.title ?? trans.untitledForm,
            child: SmartRefresherWrapper(
              enablePullDown: true,
              onRefresh: onRefresh,
              controller: _refreshController,
              child: _buildBody(state),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(DynamicFormDetailState state) {
    final tabs = {
      trans.questions: (context) => _buildQuestionsPage(state),
      trans.responses: (context) => _buildResponsePage(state),
    };
    return TabPageWidget(
      length: tabs.length,
      initialIndex: _pageIdxValue.value,
      allowImplicitScrolling: true,
      pageController: _pageController,
      isTabScrollable: tabs.length > 3,
      onPageChanged: (page) {
        hideKeyBoard();
        _pageIdxValue.value = page;
      },
      labelColor: themeColor.primary,
      indicatorColor: themeColor.primary,
      tabBuilder: (context, index) {
        return Tab(
          text: tabs.entries.elementAt(index).key.capitalizeFirstOfEach(),
        );
      },
      pageBuilder: (context, index) {
        return tabs.entries.elementAt(index).value.call(context);
      },
    );
  }

  Widget _buildQuestionsPage(DynamicFormDetailState state) {
    return const FormQuestionPage();
  }

  Widget _buildResponsePage(DynamicFormDetailState state) {
    return const FormResponsePage();
  }
}

/// Inherited
class DynamicFormDetailScreenInherited extends InheritedWidget {
  const DynamicFormDetailScreenInherited({
    super.key,
    required this.state,
    required super.child,
  });

  final DynamicFormDetailScreenState state;

  static DynamicFormDetailScreenInherited? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<DynamicFormDetailScreenInherited>();
  }

  static DynamicFormDetailScreenInherited of(BuildContext context) {
    final result = maybeOf(context);
    assert(
      result != null,
      'No DynamicFormDetailScreenInherited found in context',
    );
    return result!;
  }

  @override
  bool updateShouldNotify(DynamicFormDetailScreenInherited oldWidget) =>
      state != oldWidget.state;
}
