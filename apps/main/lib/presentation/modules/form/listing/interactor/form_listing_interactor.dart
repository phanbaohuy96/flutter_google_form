import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/models/form.dart';
import '../repository/form_listing_repository.dart';

part 'form_listing_interactor.impl.dart';

abstract class FormListingInteractor {
  Pagination get pagination;

  Future<List<DynamicForm>> getData();

  Future<List<DynamicForm>> loadMoreData();
}
