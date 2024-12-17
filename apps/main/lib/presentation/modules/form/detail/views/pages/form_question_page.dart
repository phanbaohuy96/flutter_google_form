import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../../../../generated/assets.dart';
import '../../../../../../l10n/localization_ext.dart';
import '../../../../../extentions/extention.dart';
import '../../../shared/widgets/form_element_response_widget.dart';
import '../../bloc/dynamic_form_detail_bloc.dart';
import '../dynamic_form_detail_screen.dart';

class FormQuestionPage extends StatefulWidget {
  const FormQuestionPage({super.key});

  @override
  State<FormQuestionPage> createState() => _FormQuestionPageState();
}

class _FormQuestionPageState extends State<FormQuestionPage> {
  late ThemeData _themeData;

  TextTheme get textTheme => _themeData.textTheme;

  late AppLocalizations trans;

  DynamicFormDetailScreenState get parent =>
      DynamicFormDetailScreenInherited.of(context).state;

  @override
  Widget build(BuildContext context) {
    _themeData = context.theme;
    trans = translate(context);
    return MediaQuery.removePadding(
      context: context,
      child: BlocBuilder<DynamicFormDetailBloc, DynamicFormDetailState>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SmartRefresherWrapper(
                enablePullDown: true,
                onRefresh: parent.onRefresh,
                controller: parent.detailPageController,
                child: _buildBody(state),
              ),
            ),
            bottomNavigationBar: _buildFooter(state),
          );
        },
      ),
    );
  }

  Widget _buildBody(DynamicFormDetailState state) {
    if (state is SubmitResponseSuccess) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageView(
              source: Assets.svg.icCheckDouble,
              width: 140,
              height: 140,
              fit: BoxFit.cover,
              color: themeColor.primary,
            ),
            const SizedBox(height: 12),
            Text(
              trans.submitResponseSuccessfully,
              style: textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 16,
          ),
        ),
        SliverList.separated(
          itemBuilder: (context, index) {
            final element = state.questions[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FormElementResponseFactoryWidget(
                  element: element,
                  response: state.composingResponses[element.id]!,
                  onResponseUpdate: parent.onResponseUpdate,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(
            height: 8,
          ),
          itemCount: state.questions.length,
        ),
      ],
    );
  }

  Widget _buildFooter(DynamicFormDetailState state) {
    Widget button;

    if (state is SubmitResponseSuccess) {
      button = ThemeButton.primary(
        title: trans.submitAnotherOne,
        onPressed: parent.submitAnotherOne,
      );
    } else {
      button = ThemeButton.primary(
        title: trans.submit,
        onPressed: parent.submit,
      );
    }
    return FooterWidget(
      child: button,
    );
  }
}
