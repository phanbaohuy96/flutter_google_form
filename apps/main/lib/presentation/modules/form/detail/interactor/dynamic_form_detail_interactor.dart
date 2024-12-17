import 'package:core/core.dart';
import 'package:dartx/dartx.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/models/form.dart';
import '../repository/dynamic_form_detail_repository.dart';

part 'dynamic_form_detail_interactor.impl.dart';

abstract class DynamicFormDetailInteractor {
  Future<DynamicForm?> getDynamicFormDetail(String id);

  Map<String?, DynamicFormResponse> generateComposingResponse(
    DynamicForm form,
    Map<String?, DynamicFormResponse> current,
  );

  Future<List<DynamicFormResponse>> getFormRespoinses(String formId);

  Future<bool> submitResponse(
    String formId,
    Map<String?, DynamicFormResponse> composingResponses,
  );
}
