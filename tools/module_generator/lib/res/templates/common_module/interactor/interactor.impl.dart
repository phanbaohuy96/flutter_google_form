import '../../../../common/definations.dart';

const commonModuleInteractorImpl =
    '''part of '${moduleNameKey}_interactor.dart';

@Injectable(as: ${classNameKey}Interactor)
class ${classNameKey}InteractorImpl extends ${classNameKey}Interactor {
  final ${classNameKey}Repository _repository;

  ${classNameKey}InteractorImpl(this._repository);
}''';
