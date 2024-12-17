part of 'upsert_form_repository.dart';

@Injectable(as: UpsertFormRepository)
class UpsertFormRepositoryImpl extends UpsertFormRepository {
  final DynamicFormDao _dynamicFormDao;

  UpsertFormRepositoryImpl(this._dynamicFormDao);

  @override
  Future<DynamicForm> saveForm(DynamicForm form) async {
    final res = await _dynamicFormDao.upsert(form);

    if (!res) {
      throw Exception('Unknown error occurred');
    }
    return form;
  }
}
