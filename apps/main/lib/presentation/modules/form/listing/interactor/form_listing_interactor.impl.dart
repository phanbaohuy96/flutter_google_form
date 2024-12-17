part of 'form_listing_interactor.dart';

@Injectable(as: FormListingInteractor)
class FormListingInteractorImpl extends FormListingInteractor {
  final FormListingRepository _repository;

  FormListingInteractorImpl(this._repository);

  late final _listingUsecase = ListingUseCase<DynamicForm, dynamic>(
    (offset, limit, [param]) => _repository.getData(offset, limit),
  );

  @override
  Pagination get pagination => _listingUsecase.pagination;

  @override
  Future<List<DynamicForm>> getData() {
    return _listingUsecase.getData();
  }

  @override
  Future<List<DynamicForm>> loadMoreData() {
    return _listingUsecase.loadMoreData();
  }
}
