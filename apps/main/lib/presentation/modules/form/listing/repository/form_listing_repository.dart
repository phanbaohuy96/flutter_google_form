import 'package:injectable/injectable.dart';

import '../../../../../data/data_source/local/sqlite/dao/dynamic_form_dao.dart';
import '../../../../../data/models/form.dart';

part 'form_listing_repository.impl.dart';

abstract class FormListingRepository {
  Future<List<DynamicForm>> getData(
    int offset,
    int limit,
  );
}
