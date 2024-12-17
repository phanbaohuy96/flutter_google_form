import '../../../../common/definations.dart';

const listingModuleInteractorImpl =
    '''part of '${moduleNameKey}_interactor.dart';

@Injectable(as: ${classNameKey}Interactor)
class ${classNameKey}InteractorImpl extends ${classNameKey}Interactor {
  final ${classNameKey}Repository _repository;

  ${classNameKey}InteractorImpl(this._repository);

  late final _listingUsecase = ListingUseCase<$modelNameKey, dynamic>(
    (offset, limit, [param]) => _repository.getData(offset, limit),
  );

  @override
  Pagination get pagination => _listingUsecase.pagination;

  @override
  Future<List<$modelNameKey>> getData() {
    return _listingUsecase.getData();
  }

  @override
  Future<List<$modelNameKey>> loadMoreData() {
    return _listingUsecase.loadMoreData();
  }
}
''';
