import '../../../../common/definations.dart';

const listingModuleState = '''// ignore_for_file: unused_element
part of '${moduleNameKey}_bloc.dart';

@freezed
class _ViewModel with _\$ViewModel {
  const factory _ViewModel({
    @Default([]) final List<$modelNameKey> data,
    @Default(false) final bool canLoadMore,
  }) = __ViewModel;
}

abstract class ${classNameKey}State {
  final _ViewModel viewModel;

  ${classNameKey}State(this.viewModel);

  T copyWith<T extends ${classNameKey}State>({
    _ViewModel? viewModel,
  }) {
    return _factories[T == ${classNameKey}State ? runtimeType : T]!(
      viewModel ?? this.viewModel,
    );
  }

  List<$modelNameKey> get data => viewModel.data;
  bool get canLoadMore => viewModel.canLoadMore;
}

class ${classNameKey}Initial extends ${classNameKey}State {
  ${classNameKey}Initial({
    required _ViewModel viewModel,
  }) : super(viewModel);
}

final _factories = <
    Type,
    Function(
  _ViewModel viewModel,
)>{
  ${classNameKey}Initial: (viewModel) => ${classNameKey}Initial(
        viewModel: viewModel,
      ),
};''';
