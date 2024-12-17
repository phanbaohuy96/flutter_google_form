part of 'upsert_form_screen.dart';

extension UpsertFormAction on _UpsertFormScreenState {
  void _blocListener(BuildContext context, UpsertFormState state) {}

  Future<bool> _onBack() async {
    final result = await showNoticeConfirmDialog(
      context: context,
      title: trans.inform,
      message: trans.discardFormConfirmMsg,
    );
    if (result) {
      Navigator.pop(context);
    }
    return result;
  }

  void _onTitleChanged(String title) {
    bloc.add(
      UpdateFormEvent(
        bloc.state.form.copyWith(
          title: title,
        ),
      ),
    );
  }

  void _onAddNewQuestion() {
    bloc.add(AddFormElementEvent());
  }

  void _onUpdateElement(DynamicFormElement element) {
    bloc.add(UpdateFormElementEvent(element));
  }

  void _onRemoveElement(DynamicFormElement element) {
    bloc.add(RemoveFormElementEvent(element));
  }

  Future _onSave() async {
    final completer = Completer<DynamicForm?>();

    showLoading();

    bloc.add(SaveFormEvent(completer));

    final value = await completer.future;
    hideLoading();

    if (value != null) {
      Navigator.pop(context, value);
    }
  }
}
