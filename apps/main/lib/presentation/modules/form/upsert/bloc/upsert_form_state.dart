// ignore_for_file: unused_element
part of 'upsert_form_bloc.dart';

@freezed
class _ViewModel with _$ViewModel {
  const factory _ViewModel({
    @Default(DynamicForm()) final DynamicForm form,
    @Default(-1) final int focusedIndex,
  }) = __ViewModel;
}

abstract class UpsertFormState {
  final _ViewModel viewModel;

  UpsertFormState(this.viewModel);

  T copyWith<T extends UpsertFormState>({
    _ViewModel? viewModel,
  }) {
    return _factories[T == UpsertFormState ? runtimeType : T]!(
      viewModel ?? this.viewModel,
    );
  }

  DynamicForm get form => viewModel.form;

  int get focusedIndex => viewModel.focusedIndex;

  List<DynamicFormElement> get elements => [...?form.elements];
}

class UpsertFormInitial extends UpsertFormState {
  UpsertFormInitial({
    required _ViewModel viewModel,
  }) : super(viewModel);
}

final _factories = <Type,
    Function(
  _ViewModel viewModel,
)>{
  UpsertFormInitial: (viewModel) => UpsertFormInitial(
        viewModel: viewModel,
      ),
};
