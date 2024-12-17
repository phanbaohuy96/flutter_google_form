import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../../../data/models/form.dart';
import '../../../../../l10n/generated/app_localizations.dart';
import '../../../../base/base.dart';
import '../../../../extentions/extention.dart';
import '../../shared/widgets/dynamic_form_element_widget.dart';
import '../bloc/upsert_form_bloc.dart';

part 'upsert_form.action.dart';

class UpsertFormScreen extends StatefulWidget {
  static String routeName = '/upsert_form';

  const UpsertFormScreen({Key? key}) : super(key: key);

  @override
  State<UpsertFormScreen> createState() => _UpsertFormScreenState();
}

class _UpsertFormScreenState extends StateBase<UpsertFormScreen> {
  @override
  UpsertFormBloc get bloc => BlocProvider.of(context);

  late ThemeData _themeData;

  TextTheme get textTheme => _themeData.textTheme;

  late AppLocalizations trans;

  @override
  Widget build(BuildContext context) {
    _themeData = context.theme;
    trans = translate(context);
    return ScreenForm(
      title: trans.createForm,
      bottomNavigationBar: _buildFooter(),
      onBack: _onBack,
      child: BlocConsumer<UpsertFormBloc, UpsertFormState>(
        listener: _blocListener,
        builder: (context, state) {
          return _buildBody(state);
        },
      ),
    );
  }

  Widget _buildFooter() {
    return FooterWidget(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ThemeButton.outline(
              title: trans.cancel,
              onPressed: _onBack,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ThemeButton.primary(
              title: trans.save,
              onPressed: _onSave,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(UpsertFormState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          SliverToBoxAdapter(
            child: InputContainer(
              text: state.form.title,
              fillColor: themeColor.themePrimary,
              hint: trans.untitledForm,
              onTextChanged: _onTitleChanged,
            ),
          ),

          /// Questions
          if (state.elements.isNotEmpty) ...[
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverList.separated(
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DynamicFormElementFactoryWidget(
                      element: state.elements[index],
                      onUpdate: _onUpdateElement,
                      onRemove: _onRemoveElement,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: state.elements.length,
            ),
          ],
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),

          /// Add new question button
          SliverToBoxAdapter(
            child: ThemeButton.outline(
              title: trans.addQuestion,
              onPressed: _onAddNewQuestion,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
        ],
      ),
    );
  }
}
