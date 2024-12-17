import '../../../../common/definations.dart';

const listingModuleRepositoryImpl =
    '''part of '${moduleNameKey}_repository.dart';

@Injectable(as: ${classNameKey}Repository)
class ${classNameKey}RepositoryImpl extends ${classNameKey}Repository {
  @override
  Future<List<$modelNameKey>> getData(
    int offset,
    int limit,
  ) {
    return Future.value(<$modelNameKey>[]);
  }
}''';
