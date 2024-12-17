import 'package:injectable/injectable.dart';

import '../../../../../data/models/form.dart';
import '../repository/upsert_form_repository.dart';

part 'upsert_form_interactor.impl.dart';

abstract class UpsertFormInteractor {
  Future<DynamicForm> saveForm(DynamicForm form);
}
