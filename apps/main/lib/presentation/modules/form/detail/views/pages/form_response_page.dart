import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../../../../l10n/generated/app_localizations.dart';
import '../../../../../extentions/extention.dart';
import '../../../form.dart';

class FormResponsePage extends StatefulWidget {
  const FormResponsePage({super.key});

  @override
  State<FormResponsePage> createState() => _FormResponsePageState();
}

class _FormResponsePageState extends State<FormResponsePage> {
  late ThemeData _themeData;

  TextTheme get textTheme => _themeData.textTheme;

  late AppLocalizations trans;

  DynamicFormDetailScreenState get parent =>
      DynamicFormDetailScreenInherited.of(context).state;

  @override
  Widget build(BuildContext context) {
    _themeData = context.theme;
    trans = translate(context);
    return BlocBuilder<DynamicFormDetailBloc, DynamicFormDetailState>(
      builder: (context, state) {
        return SmartRefresherWrapper(
          enablePullDown: true,
          onRefresh: parent.onRefresh,
          controller: parent.responsePageController,
          child: _buildBody(state),
        );
      },
    );
  }

  Widget _buildBody(DynamicFormDetailState state) {
    return const SizedBox();
  }
}
