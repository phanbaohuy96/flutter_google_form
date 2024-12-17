import 'package:core/core.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../../data/models/form.dart';
import '../../../../../extentions/extention.dart';
import '../form_element_response_widget.dart';
import '../form_element_widget.dart';

class FormElementRadioWidget extends StatefulWidget {
  const FormElementRadioWidget({
    super.key,
    this.maxOptions = 5,
  });

  final int maxOptions;

  @override
  State<FormElementRadioWidget> createState() => _FormElementRadioWidgetState();
}

class _FormElementRadioWidgetState extends State<FormElementRadioWidget>
    with FormElementStateMixin {
  List<DynamicFormElementMetadata> get optionts => [...?element.metadata];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...optionts.map(_buildOption),
        if (optionts.length < widget.maxOptions) addOptionButton(),
      ],
    );
  }

  Widget get _prefixWidget => Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        width: 18,
        height: 18,
      );

  Widget _buildOption(DynamicFormElementMetadata e) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _prefixWidget,
          const SizedBox(width: 12),
          Expanded(
            child: InputContainer(
              text: e.lable,
              withClearButton: false,
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 4,
              ),
              onTextChanged: (t) {
                updateOption(e.copyWith(lable: t));
              },
            ),
          ),
          const SizedBox(width: 8),
          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => removeOption(e),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Icon(
                Icons.close,
                size: 18,
                color: Colors.grey.shade600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget addOptionButton() {
    final trans = translate(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _prefixWidget,
          const SizedBox(width: 12),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: trans.addOption,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        addOption(
                          DynamicFormElementMetadata(
                            lable: '${trans.option} ${optionts.length + 1}',
                          ),
                        );
                      },
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  if (optionts.every(
                    (e) => e.isOther != true,
                  )) ...[
                    TextSpan(text: ' ${trans.or} '),
                    TextSpan(
                      text: '${trans.add} "${trans.other.capitalizeFirst()}"',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: Colors.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          addOption(
                            DynamicFormElementMetadata(
                              lable: trans.other.capitalizeFirst(),
                              isOther: true,
                            ),
                          );
                        },
                    ),
                  ],
                ],
              ),
              style: context.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  void addOption(DynamicFormElementMetadata option) {
    final _options = [
      ...optionts,
      option.copyWith(
        id: const Uuid().v4(),
      ),
    ]..sort(
        /// Sort "other" option as last
        (a, b) => a.isOther == true ? 1 : 0,
      );
    update(
      element.copyWith(
        metadata: _options,
      ),
    );
  }

  void updateOption(DynamicFormElementMetadata option) {
    update(
      element.copyWith(
        metadata: [
          ...optionts.map(
            (e) {
              if (e == option) {
                return option;
              }
              return e;
            },
          ),
        ],
      ),
    );
  }

  void removeOption(DynamicFormElementMetadata option) {
    update(
      element.copyWith(
        metadata: [
          ...optionts.where(
            (e) => e != option,
          ),
        ],
      ),
    );
  }
}

class FormElementResponseRadioWidget extends StatefulWidget {
  const FormElementResponseRadioWidget({
    super.key,
    this.maxOptions = 5,
  });

  final int maxOptions;

  @override
  State<FormElementResponseRadioWidget> createState() =>
      _FormElementResponseRadioWidgetState();
}

class _FormElementResponseRadioWidgetState
    extends State<FormElementResponseRadioWidget>
    with FormElementResponseStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...optionts.map(_buildOptions),
      ],
    );
  }

  Widget _buildOptions(DynamicFormElementMetadata option) {
    return RadioListTile<DynamicFormElementMetadata>(
      value: option,
      groupValue: optionts.firstOrNullWhere(
        (e) => e.id == response.optionId,
      ),
      dense: true,
      title: option.isOther == true
          ? Row(
              children: [
                Text(
                  '${option.lable}: ',
                ),
                Expanded(
                  child: InputContainer(
                    text: response.answer,
                    isDense: true,
                    maxLines: null,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 4,
                    ),
                    onTextChanged: (p0) {
                      updateResponse(
                        element,
                        response.copyWith(
                          answer: p0,
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          : Text.rich(
              TextSpan(
                text: option.lable,
              ),
            ),
      splashRadius: 0,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onChanged: (DynamicFormElementMetadata? value) {
        updateResponse(
          element,
          response.copyWith(
            optionId: value?.id,
            answer: null,
          ),
        );
      },
    );
  }
}
