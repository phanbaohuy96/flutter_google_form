part of 'dynamic_form_detail_screen.dart';

extension DynamicFormDetailAction on DynamicFormDetailScreenState {
  void _blocListener(BuildContext context, DynamicFormDetailState state) {
    hideLoading();
  }

  void onRefresh() {
    (widget.args?.id ?? widget.args?.initial?.id)?.let((id) {
      bloc.add(GetDynamicFormDetailEvent(id));
    });
  }

  void onResponseUpdate(
    DynamicFormElement element,
    DynamicFormResponse response,
  ) {
    bloc.add(UpdateComposingResponseEvent(element, response));
  }

  Future submit() async {
    final composingResponses = bloc.state.composingResponses;

    for (final response in composingResponses.entries) {
      if ([
        response.value.element?.required == true,
        response.value.answer.isNullOrBlank,
        response.value.optionId.isNullOrBlank,
      ].every(
        (e) => e,
      )) {
        return showFlushBar(
          title: trans.inform,
          message: trans.pleaseFillTheRequiredResponse,
          duration: 2.seconds,
        );
      }
    }

    showLoading();
    bloc.add(SubmitResponseEvent());
  }

  void submitAnotherOne() {
    bloc.add(ResetSubmitStateEvent());
  }
}
