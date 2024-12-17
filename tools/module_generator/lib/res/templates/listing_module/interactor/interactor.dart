import '../../../../common/definations.dart';

const listingModuleInteractor = '''import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import '../repository/${moduleNameKey}_repository.dart';

part '${moduleNameKey}_interactor.impl.dart';

abstract class ${classNameKey}Interactor {
  Pagination get pagination;

  Future<List<$modelNameKey>> getData();

  Future<List<$modelNameKey>> loadMoreData();
}
''';
