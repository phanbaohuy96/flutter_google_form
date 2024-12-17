import 'package:core/core.dart';
import 'package:flutter/widgets.dart';

import '../../../../../extentions/extention.dart';
import '../dynamic_form_element_widget.dart';

class DynamicFormElementParagraphWidget extends StatefulWidget {
  const DynamicFormElementParagraphWidget({
    super.key,
  });

  @override
  State<DynamicFormElementParagraphWidget> createState() =>
      _DynamicFormElementParagraphWidgetState();
}

class _DynamicFormElementParagraphWidgetState
    extends State<DynamicFormElementParagraphWidget>
    with DynamicFormElementStateMixin {
  @override
  Widget build(BuildContext context) {
    final trans = translate(context);
    return InputContainer(
      hint: trans.longAnswerText,
      readOnly: true,
    );
  }
}
