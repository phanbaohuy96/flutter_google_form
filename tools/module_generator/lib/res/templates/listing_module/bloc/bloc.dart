import '../../../../common/definations.dart';

const listingModuleBloc = '''import 'dart:async';

import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart' hide Order;

import '${importPartKey}base/base.dart';
import '../interactor/${moduleNameKey}_interactor.dart';

part '${moduleNameKey}_bloc.freezed.dart';
part '${moduleNameKey}_event.dart';
part '${moduleNameKey}_state.dart';

@Injectable()
class ${classNameKey}Bloc extends AppBlocBase<${classNameKey}Event, ${classNameKey}State> {
  final ${classNameKey}Interactor _interactor;
  
  ${classNameKey}Bloc(this._interactor) : 
    super(${classNameKey}Initial(viewModel: const _ViewModel())) {
    on<Get${modelNameKey}sEvent>(_onGet${modelNameKey}sEvent);
    on<LoadMore${modelNameKey}sEvent>(_onLoadMore${modelNameKey}sEvent);
  }

  Future<void> _onGet${modelNameKey}sEvent(
    Get${modelNameKey}sEvent event,
    Emitter<${classNameKey}State> emit,
  ) async {
    final data = await _interactor.getData();
    emit(
      state.copyWith<${classNameKey}Initial>(
        viewModel: state.viewModel.copyWith(
          data: data,
          canLoadMore: _interactor.pagination.canNext,
        ),
      ),
    );
  }

  Future<void> _onLoadMore${modelNameKey}sEvent(
    LoadMore${modelNameKey}sEvent event,
    Emitter<${classNameKey}State> emit,
  ) async {
    final moreData = await _interactor.loadMoreData();
    emit(
      state.copyWith<${classNameKey}Initial>(
        viewModel: state.viewModel.copyWith(
          data: [...state.viewModel.data, ...moreData],
          canLoadMore: _interactor.pagination.canNext,
        ),
      ),
    );
  }
}
''';
