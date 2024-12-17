import '../../../../common/definations.dart';

const detailModuleBloc = '''import 'dart:async';

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
  
  ${classNameKey}Bloc(
    @factoryParam $modelNameKey? data, 
    this._interactor,
  ) : super(${classNameKey}Initial(viewModel: _ViewModel(data: data))) {
    on<Get${classNameKey}Event>(_onGet${classNameKey}Event);
  }

  Future<void> _onGet${classNameKey}Event(
    Get${classNameKey}Event event,
    Emitter<${classNameKey}State> emit,
  ) async {
    final data = await _interactor.get$classNameKey(event.id);
    emit(
      state.copyWith<${classNameKey}Initial>(
        viewModel: state.viewModel.copyWith(
          data: data,
        ),
      ),
    );
  }
}
''';
