import 'package:injectable/injectable.dart';

import '../../../../../data/data_source/local/sqlite/dao/dynamic_form_dao.dart';
import '../../../../../data/data_source/local/sqlite/dao/dynamic_form_response.dart';
import '../../../../../data/models/form.dart';
import '../../../../../domain/entity/dynamic_form_filter.entity.dart';

part 'dynamic_form_detail_repository.impl.dart';

abstract class DynamicFormDetailRepository {
  Future<DynamicForm?> getDynamicFormDetail(String id);

  Future<List<DynamicFormResponse>> getFormRespoinses(String formId);

  Future<bool> submitResponse(
    String formId,
    DynamicFormResponse response,
  );
}
