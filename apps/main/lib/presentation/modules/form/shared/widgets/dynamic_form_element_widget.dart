import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../../../data/models/form.dart';
import '../../../../extentions/extention.dart';
import 'form_element/form_paragraph_element.dart';
import 'form_element/form_radio_element.dart';

/// Inherited
class DynamicFormElementFactoryInherited extends InheritedWidget {
  const DynamicFormElementFactoryInherited({
    super.key,
    required this.factoryWidget,
    required super.child,
  });

  final DynamicFormElementFactoryWidget factoryWidget;

  static DynamicFormElementFactoryInherited? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<
        DynamicFormElementFactoryInherited>();
  }

  static DynamicFormElementFactoryInherited of(BuildContext context) {
    final result = maybeOf(context);
    assert(result != null, 'No DashboardScreenStateInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(DynamicFormElementFactoryInherited oldWidget) =>
      factoryWidget != oldWidget.factoryWidget;
}

/// Mixin
mixin DynamicFormElementStateMixin<T extends StatefulWidget> on State<T> {
  DynamicFormElementFactoryWidget get parent =>
      DynamicFormElementFactoryInherited.of(context).factoryWidget;

  DynamicFormElement get element => parent.element;

  bool get isEditing => parent.isEditing;

  bool get isCustomizationMode => parent.isEditing;

  bool get isAnswerMode => parent.isEditing;

  void update(DynamicFormElement element) {
    parent.onUpdate?.call(element);
  }
}

/// Factory
class DynamicFormElementFactoryWidget extends StatelessWidget {
  const DynamicFormElementFactoryWidget({
    super.key,
    required this.element,
    this.onUpdate,
    this.onRemove,
  });

  final DynamicFormElement element;
  final void Function(DynamicFormElement element)? onUpdate;
  final void Function(DynamicFormElement element)? onRemove;

  bool get isEditing => onUpdate != null;

  @override
  Widget build(BuildContext context) {
    final trans = translate(context);
    final textTheme = context.textTheme;
    return DynamicFormElementFactoryInherited(
      factoryWidget: this,
      child: Column(
        children: [
          /// title section
          _buildTitle(context),
          const SizedBox(height: 8),

          /// change element type section
          if (isEditing) ...[
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

          /// actions button
          if (isEditing) ...[
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
    );
  }

  Widget _buildTitle(BuildContext context) {
    final textTheme = context.textTheme;
    if (!isEditing) {
      return Text(
        element.title ?? '',
        style: textTheme.headlineSmall,
      );
    }

    final trans = translate(context);

    return InputContainer(
      text: element.title,
      hint: trans.inputQuestion,
      onTextChanged: (title) {
        onUpdate!(element.copyWith(title: title));
      },
    );
  }

  Widget _buildElement(BuildContext context) {
    return switch (element.type) {
      DynamicFormElementType.radio => const DynamicFormElementRadioWidget(),
      DynamicFormElementType.paragraph =>
        const DynamicFormElementParagraphWidget(),
      _ => const SizedBox(),
    };
  }
}
