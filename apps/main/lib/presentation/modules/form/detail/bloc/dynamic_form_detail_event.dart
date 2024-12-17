part of 'dynamic_form_detail_bloc.dart';

abstract class DynamicFormDetailEvent {}

class GetDynamicFormDetailEvent extends DynamicFormDetailEvent {
  final String id;
  GetDynamicFormDetailEvent(this.id);
}

class UpdateComposingResponseEvent extends DynamicFormDetailEvent {
  final DynamicFormElement element;
  final DynamicFormResponse response;

  UpdateComposingResponseEvent(this.element, this.response);
}

class SubmitResponseEvent extends DynamicFormDetailEvent {}

class ResetSubmitStateEvent extends DynamicFormDetailEvent {}
