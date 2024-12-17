import '../../../../common/definations.dart';

const commonModuleInteractor = '''import 'package:injectable/injectable.dart';

import '../repository/${moduleNameKey}_repository.dart';

part '${moduleNameKey}_interactor.impl.dart';

abstract class ${classNameKey}Interactor {}''';
