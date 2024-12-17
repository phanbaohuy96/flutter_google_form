part of 'dynamic_form_detail_interactor.dart';

@Injectable(as: DynamicFormDetailInteractor)
class DynamicFormDetailInteractorImpl extends DynamicFormDetailInteractor {
  final DynamicFormDetailRepository _repository;

  DynamicFormDetailInteractorImpl(this._repository);

  @override
  Future<DynamicForm?> getDynamicFormDetail(String id) {
    return _repository.getDynamicFormDetail(id);
  }

  @override
  Future<List<DynamicFormResponse>> getFormRespoinses(String formId) {
    return _repository.getFormRespoinses(formId);
  }

  @override
  Map<String?, DynamicFormResponse> generateComposingResponse(
    DynamicForm form,
    Map<String?, DynamicFormResponse> current,
  ) {
    final elements = [...?form.elements];
    final composingResponses = {...current};
    for (final element in elements) {
      if (composingResponses[element] == null) {
        final defaultOption = [...?element.metadata].firstOrNullWhere(
          (e) => e.idDefault == true,
        );
        composingResponses[element.id] = DynamicFormResponse(
          elementId: element.id,
          element: element,
          optionId: defaultOption?.id,
          option: defaultOption,
        );
      }
    }
    return composingResponses;
  }

  @override
  Future<bool> submitResponse(
    String formId,
    Map<String?, DynamicFormResponse> composingResponses,
  ) async {
    final response = composingResponses.values
        .where(
          (e) => e.answer.isNotNullOrBlank || e.optionId.isNotNullOrBlank,
        )
        .map(
          (e) => e.copyWith(
            id: const Uuid().v4(),
          ),
        );
    final res = await Future.wait(
      [
        ...response.map(
          (r) => _repository.submitResponse(formId, r),
        ),
      ],
      eagerError: true,
    );

    return res.every(
      (e) => e == true,
    );
  }
}
