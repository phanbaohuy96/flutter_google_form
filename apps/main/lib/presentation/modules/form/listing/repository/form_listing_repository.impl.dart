part of 'form_listing_repository.dart';

@Injectable(as: FormListingRepository)
class FormListingRepositoryImpl extends FormListingRepository {
  final DynamicFormDao _dynamicFormDao;

  FormListingRepositoryImpl(this._dynamicFormDao);

  @override
  Future<List<DynamicForm>> getData(
    int offset,
    int limit,
  ) {
    return _dynamicFormDao.get(
      offset: offset,
      limit: limit,
    );
  }
}
