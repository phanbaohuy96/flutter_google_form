part of 'dynamic_form_detail_repository.dart';

@Injectable(as: DynamicFormDetailRepository)
class DynamicFormDetailRepositoryImpl extends DynamicFormDetailRepository {
  final DynamicFormDao _dynamicFormDao;
  final DynamicFormResponseDao _dynamicFormResponseDao;

  DynamicFormDetailRepositoryImpl(
    this._dynamicFormDao,
    this._dynamicFormResponseDao,
  );

  @override
  Future<DynamicForm?> getDynamicFormDetail(String id) {
    final filter = DynamicFormFilter(id: id);
    return _dynamicFormDao.get(
      whereOption: (filter.sqliteWhere, filter.sqliteWhereArgs),
      limit: 1,
    ).then(
      (value) {
        return value.firstOrNull;
      },
    );
  }

  @override
  Future<List<DynamicFormResponse>> getFormRespoinses(String formId) {
    final filter = DynamicFormResponseFilter(formId: formId);
    return _dynamicFormResponseDao.get(
      whereOption: (filter.sqliteWhere, filter.sqliteWhereArgs),
    );
  }

  @override
  Future<bool> submitResponse(
    String formId,
    DynamicFormResponse response,
  ) {
    return _dynamicFormResponseDao.upsert(
      response.copyWith(formId: formId),
    );
  }
}
