import 'package:core/core.dart';
import 'package:flutter/widgets.dart';

import '../../../../../extentions/extention.dart';
import '../form_element_response_widget.dart';
import '../form_element_widget.dart';

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
    );
  }
}

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
      text: response.answer,
      onTextChanged: (p0) {
        updateResponse(
          element,
          response.copyWith(answer: p0),
        );
      },
    );
  }
}
