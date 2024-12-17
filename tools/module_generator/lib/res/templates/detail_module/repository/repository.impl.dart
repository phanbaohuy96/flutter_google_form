import '../../../../common/definations.dart';

const detailModuleRepositoryImpl =
    '''part of '${moduleNameKey}_repository.dart';

@Injectable(as: ${classNameKey}Repository)
class ${classNameKey}RepositoryImpl extends ${classNameKey}Repository {
  @override
  Future<$modelNameKey?> get$classNameKey(String id) {
    return Future.value(null);
  }
}''';
