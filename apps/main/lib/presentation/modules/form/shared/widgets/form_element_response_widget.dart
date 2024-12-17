import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../../../data/models/form.dart';
import '../../../../extentions/extention.dart';
import 'form_element/form_paragraph_element.dart';
import 'form_element/form_radio_element.dart';

/// Inherited
class FormElementResponseFactoryInherited extends InheritedWidget {
  const FormElementResponseFactoryInherited({
    super.key,
    required this.factoryWidget,
    required super.child,
  });

  final FormElementResponseFactoryWidget factoryWidget;

  static FormElementResponseFactoryInherited? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<
        FormElementResponseFactoryInherited>();
  }

  static FormElementResponseFactoryInherited of(BuildContext context) {
    final result = maybeOf(context);
    assert(
      result != null,
      'No FormElementResponseFactoryWidget found in context',
    );
    return result!;
  }

  @override
  bool updateShouldNotify(FormElementResponseFactoryInherited oldWidget) =>
      factoryWidget != oldWidget.factoryWidget;
}

/// Mixin
mixin FormElementResponseStateMixin<T extends StatefulWidget> on State<T> {
  FormElementResponseFactoryWidget get parent =>
      FormElementResponseFactoryInherited.of(context).factoryWidget;

  DynamicFormElement get element => parent.element;

  List<DynamicFormElementMetadata> get optionts => [...?element.metadata];

  DynamicFormResponse get response => parent.response;

  void updateResponse(
    DynamicFormElement element,
    DynamicFormResponse response,
  ) {
    parent.onResponseUpdate.call(element, response);
  }
}

/// Factory
class FormElementResponseFactoryWidget extends StatelessWidget {
  const FormElementResponseFactoryWidget({
    super.key,
    required this.element,
    required this.response,
    required this.onResponseUpdate,
  });

  final DynamicFormElement element;
  final DynamicFormResponse response;
  final void Function(DynamicFormElement element, DynamicFormResponse response)
      onResponseUpdate;

  @override
  Widget build(BuildContext context) {
    return FormElementResponseFactoryInherited(
      factoryWidget: this,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /// title section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: _buildTitle(context),
          ),

          /// body section
          _buildElement(context),

          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    final trans = translate(context);

    return InputTitleWidget(
      title: element.title ?? trans.untitled,
      style: context.textTheme.titleMedium,
      required: element.required == true,
    );
  }

  Widget _buildElement(BuildContext context) {
    return switch (element.type) {
      DynamicFormElementType.radio => const FormElementResponseRadioWidget(),
      DynamicFormElementType.paragraph =>
        const FormElementResponseParagraphWidget(),
      _ => const SizedBox(),
    };
  }
}
