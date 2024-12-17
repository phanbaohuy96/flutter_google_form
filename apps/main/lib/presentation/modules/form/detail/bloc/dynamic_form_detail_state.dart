// ignore_for_file: unused_element
part of 'dynamic_form_detail_bloc.dart';

@freezed
class _ViewModel with _$ViewModel {
  const factory _ViewModel({
    final DynamicForm? data,
    @Default([]) final List<DynamicFormResponse> responses,
    @Default({}) final Map<String?, DynamicFormResponse> composingResponses,
  }) = __ViewModel;
}

abstract class DynamicFormDetailState {
  final _ViewModel viewModel;

  DynamicFormDetailState(this.viewModel);

  T copyWith<T extends DynamicFormDetailState>({
    _ViewModel? viewModel,
  }) {
    return _factories[T == DynamicFormDetailState ? runtimeType : T]!(
      viewModel ?? this.viewModel,
    );
  }

  DynamicForm? get data => viewModel.data;

  List<DynamicFormElement> get questions => [...?data?.elements];

  Map<String?, DynamicFormResponse> get composingResponses =>
      viewModel.composingResponses;

  List<DynamicFormResponse> get responses => viewModel.responses;
}

class DynamicFormDetailInitial extends DynamicFormDetailState {
  DynamicFormDetailInitial({
    required _ViewModel viewModel,
  }) : super(viewModel);
}

class SubmitResponseSuccess extends DynamicFormDetailState {
  SubmitResponseSuccess({
    required _ViewModel viewModel,
  }) : super(viewModel);
}

final _factories = <Type,
    Function(
  _ViewModel viewModel,
)>{
  DynamicFormDetailInitial: (viewModel) => DynamicFormDetailInitial(
        viewModel: viewModel,
      ),
  SubmitResponseSuccess: (viewModel) => SubmitResponseSuccess(
        viewModel: viewModel,
      ),
};
