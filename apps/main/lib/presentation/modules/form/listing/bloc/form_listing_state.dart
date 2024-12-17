// ignore_for_file: unused_element
part of 'form_listing_bloc.dart';

@freezed
class _ViewModel with _$ViewModel {
  const factory _ViewModel({
    @Default([]) final List<DynamicForm> data,
    @Default(false) final bool canLoadMore,
  }) = __ViewModel;
}

abstract class FormListingState {
  final _ViewModel viewModel;

  FormListingState(this.viewModel);

  T copyWith<T extends FormListingState>({
    _ViewModel? viewModel,
  }) {
    return _factories[T == FormListingState ? runtimeType : T]!(
      viewModel ?? this.viewModel,
    );
  }

  List<DynamicForm> get data => viewModel.data;
  bool get canLoadMore => viewModel.canLoadMore;
}

class FormListingInitial extends FormListingState {
  FormListingInitial({
    required _ViewModel viewModel,
  }) : super(viewModel);
}

final _factories = <Type,
    Function(
  _ViewModel viewModel,
)>{
  FormListingInitial: (viewModel) => FormListingInitial(
        viewModel: viewModel,
      ),
};
