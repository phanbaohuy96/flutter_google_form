import '../../../../common/definations.dart';

const detailModuleInteractorImpl =
    '''part of '${moduleNameKey}_interactor.dart';

@Injectable(as: ${classNameKey}Interactor)
class ${classNameKey}InteractorImpl extends ${classNameKey}Interactor {
  final ${classNameKey}Repository _repository;

  ${classNameKey}InteractorImpl(this._repository);

  @override
  Future<$modelNameKey?> get$classNameKey(String id){
    return _repository.get$classNameKey(id);
  }
}
''';
