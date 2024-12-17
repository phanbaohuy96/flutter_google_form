import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../../../../data/models/form.dart';
import '../../../../../../l10n/generated/app_localizations.dart';
import '../../../../../extentions/extention.dart';
import '../../../form.dart';
import '../../../shared/widgets/form_element/form_paragraph_element.dart';
import '../../../shared/widgets/form_element/form_radio_element.dart';

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
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SmartRefresherWrapper(
            enablePullDown: true,
            onRefresh: parent.onRefresh,
            controller: parent.responsePageController,
            child: _buildBody(state),
          ),
        );
      },
    );
  }

  Widget _buildBody(DynamicFormDetailState state) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 16,
          ),
        ),
        ...state.questions.map(
          (element) {
            final responses = state.responses
                .where(
                  (r) => r.elementId == element.id,
                )
                .toList();
            return SliverToBoxAdapter(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: switch (element.type) {
                    DynamicFormElementType.radio =>
                      FormElementResponseStatisticsRadioWidget(
                        element: element,
                        responses: responses,
                      ),
                    DynamicFormElementType.paragraph =>
                      FormElementResponseStatisticsParagraphWidget(
                        element: element,
                        responses: responses,
                      ),
                    _ => const SizedBox(),
                  },
                ),
              ),
            );
          },
        ).insertSeparator(
          (index) => const SliverToBoxAdapter(
            child: SizedBox(
              height: 12,
            ),
          ),
        ),
      ],
    );
  }
}
