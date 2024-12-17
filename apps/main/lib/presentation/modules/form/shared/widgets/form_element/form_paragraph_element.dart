import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../../../../data/models/form.dart';
import '../../../../../extentions/extention.dart';
import '../form_element_response_widget.dart';
import '../form_element_widget.dart';

/// Customization
class FormElementParagraphWidget extends StatefulWidget {
  const FormElementParagraphWidget({
    super.key,
  });

  @override
  State<FormElementParagraphWidget> createState() =>
      _FormElementParagraphWidgetState();
}

class _FormElementParagraphWidgetState extends State<FormElementParagraphWidget>
    with FormElementStateMixin {
  @override
  Widget build(BuildContext context) {
    final trans = translate(context);
    return InputContainer(
      hint: trans.longAnswerText,
      readOnly: true,
      fillColor: Colors.transparent,
      enable: false,
    );
  }
}

/// Response
class FormElementResponseParagraphWidget extends StatefulWidget {
  const FormElementResponseParagraphWidget({
    super.key,
  });

  @override
  State<FormElementResponseParagraphWidget> createState() =>
      _FormElementResponseParagraphWidgetState();
}

class _FormElementResponseParagraphWidgetState
    extends State<FormElementResponseParagraphWidget>
    with FormElementResponseStateMixin {
  @override
  Widget build(BuildContext context) {
    final trans = translate(context);
    return InputContainer(
      hint: trans.longAnswerText,
      text: response.answer ?? '',
      onTextChanged: (p0) {
        updateResponse(
          element,
          response.copyWith(answer: p0),
        );
      },
    );
  }
}

/// Statistic
class FormElementResponseStatisticsParagraphWidget extends StatelessWidget {
  const FormElementResponseStatisticsParagraphWidget({
    super.key,
    required this.element,
    required this.responses,
  });

  final DynamicFormElement element;
  final List<DynamicFormResponse> responses;

  @override
  Widget build(BuildContext context) {
    final themeColor = context.themeColor;
    final textTheme = context.textTheme;
    final trans = translate(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          element.title ?? trans.untitled,
          style: textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Text(
          '${responses.length} ${trans.responses.toLowerCase()}',
          style: textTheme.labelMedium,
        ),

        const SizedBox(height: 12),

        /// take 3 items as represent response
        ...responses.take(3).map<Widget>(
          (e) {
            return BoxColor(
              color: themeColor.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4),
              child: Text(
                e.answer ?? '',
                style: textTheme.bodyMedium,
              ),
            );
          },
        ).insertSeparator(
          (index) => const SizedBox(height: 8),
        ),
      ],
    );
  }
}
