import '../../../../common/definations.dart';

const commonModuleRepositoryImpl =
    '''part of '${moduleNameKey}_repository.dart';

@Injectable(as: ${classNameKey}Repository)
class ${classNameKey}RepositoryImpl extends ${classNameKey}Repository {}''';
