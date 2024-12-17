part of 'upsert_form_bloc.dart';

abstract class UpsertFormEvent {}

class AddFormElementEvent extends UpsertFormEvent {
  final DynamicFormElement element;

  AddFormElementEvent({
    this.element = const DynamicFormElement(
      type: DynamicFormElementType.radio,
    ),
  });
}

class RemoveFormElementEvent extends UpsertFormEvent {
  final DynamicFormElement element;

  RemoveFormElementEvent(this.element);
}

class UpdateFormElementEvent extends UpsertFormEvent {
  final DynamicFormElement element;

  UpdateFormElementEvent(this.element);
}

class SaveFormEvent extends UpsertFormEvent {
  final Completer<DynamicForm?> completer;

  SaveFormEvent(this.completer);
}
