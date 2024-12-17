import 'package:injectable/injectable.dart';

import '../../../../../data/data_source/local/sqlite/dao/dynamic_form_dao.dart';
import '../../../../../data/models/form.dart';

part 'upsert_form_repository.impl.dart';

abstract class UpsertFormRepository {
  Future<DynamicForm> saveForm(DynamicForm form);
}
