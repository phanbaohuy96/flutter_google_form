import 'package:core/core.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

import '../../../../../data/models/form.dart';
import '../../../../extentions/extention.dart';
import 'form_element/form_paragraph_element.dart';
import 'form_element/form_radio_element.dart';

/// Inherited
class FormElementFactoryInherited extends InheritedWidget {
  const FormElementFactoryInherited({
    super.key,
    required this.factoryWidget,
    required super.child,
  });

  final FormElementFactoryWidget factoryWidget;

  static FormElementFactoryInherited? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<FormElementFactoryInherited>();
  }

  static FormElementFactoryInherited of(BuildContext context) {
    final result = maybeOf(context);
    assert(
      result != null,
      'No FormElementFactoryInherited found in context',
    );
    return result!;
  }

  @override
  bool updateShouldNotify(FormElementFactoryInherited oldWidget) =>
      factoryWidget != oldWidget.factoryWidget;
}

/// Mixin
mixin FormElementStateMixin<T extends StatefulWidget> on State<T> {
  FormElementFactoryWidget get parent =>
      FormElementFactoryInherited.of(context).factoryWidget;

  DynamicFormElement get element => parent.element;

  bool get enableToCustomize => parent.focused;

  void update(DynamicFormElement element) {
    parent.onUpdate?.call(element);
  }
}

/// Factory
class FormElementFactoryWidget extends StatelessWidget {
  const FormElementFactoryWidget({
    super.key,
    required this.element,
    this.onUpdate,
    this.onRemove,
    required this.focused,
  });

  final DynamicFormElement element;
  final void Function(DynamicFormElement element)? onUpdate;
  final void Function(DynamicFormElement element)? onRemove;
  final bool focused;

  @override
  Widget build(BuildContext context) {
    final trans = translate(context);
    final textTheme = context.textTheme;
    return FormElementFactoryInherited(
      factoryWidget: this,
      child: AnimatedSize(
        duration: 250.milliseconds,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// title section
            _buildTitle(context),
            const SizedBox(height: 8),
            if (focused) ...[
              /// change element type section

              DropdownWidget<DynamicFormElementType>(
                items: DynamicFormElementType.values,
                initial: element.type,
                itemBuilder: (type) => Text(
                  switch (type) {
                    DynamicFormElementType.radio => trans.mulitpleChoice,
                    DynamicFormElementType.paragraph => trans.paragraph,
                  },
                  style: textTheme.bodyMedium,
                ),
                onChanged: (type) {
                  onUpdate!(
                    element.copyWith(
                      type: type,
                      // Reset the metadata options when change type of element
                      metadata: [],
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
            ],

            /// body section
            _buildElement(context),
            if (focused) ...[
              /// actions button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    trans.required,
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    height: 32,
                    child: FittedBox(
                      child: Switch.adaptive(
                        value: element.required == true,
                        activeColor: context.themeColor.primary,
                        onChanged: (value) {
                          onUpdate!(element.copyWith(required: value));
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: 0.5,
                    height: 24,
                    color: Colors.grey,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 24,
                    onPressed: () => onRemove?.call(element),
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    final trans = translate(context);
    if (!focused) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: InputTitleWidget(
          title: element.title ?? trans.untitled,
          style: context.textTheme.titleMedium,
          required: element.required == true,
        ),
      );
    }

    return InputContainer(
      text: element.title,
      hint: trans.inputQuestion,
      enable: focused,
      readOnly: !focused,
      onTextChanged: (title) {
        onUpdate!(element.copyWith(title: title));
      },
    );
  }

  Widget _buildElement(BuildContext context) {
    return switch (element.type) {
      DynamicFormElementType.radio => const FormElementRadioWidget(),
      DynamicFormElementType.paragraph => const FormElementParagraphWidget(),
      _ => const SizedBox(),
    };
  }
}
