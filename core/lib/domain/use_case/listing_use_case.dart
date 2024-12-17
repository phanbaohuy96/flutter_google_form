import '../../common/constants.dart';
import '../entity/pagination.dart';

class ListingUseCase<T, P> {
  final Future<List<T>> Function(int offset, int limit, [P? param])
      _getPaginationData;

  late var _pagination = Pagination(limit: fetchLimit);
  final _data = <T>[];

  final int? _fetchLimit;

  int get fetchLimit => _fetchLimit ?? PaginationConstant.lowLimit;

  ListingUseCase(
    this._getPaginationData, [
    this._fetchLimit,
  ]);

  Pagination get pagination => _pagination;
  List<T> get data => _data;

  Future<List<T>> getData([P? param]) async {
    _pagination = Pagination(
      limit: fetchLimit,
    );
    _data.clear();
    return _getData(param);
  }

  Future<List<T>> loadMoreData([P? param]) {
    return _getData(param);
  }

  Future<List<T>> _getData([P? param]) async {
    final response = await _getPaginationData(
      _pagination.nextOffset,
      _pagination.limit,
      param,
    );
    _pagination = Pagination(
      limit: fetchLimit,
      offset: _pagination.nextOffset,
      total: _pagination.total + response.length,
    );
    _data.addAll(response);
    return response;
  }
}
