import 'package:injectable/injectable.dart';

import 'services/header/request_header_service.dart';

@module
abstract class ServiceModule {
  @lazySingleton
  RequestHeaderService requestHeaderService(
    AppConfigHeaderProvider appConfigHeaderProvider,
    LanguageHeaderProvider languageHeaderProvider,
    SystemHeaderProvider systemHeaderProvider,
  ) =>
      RequestHeaderServiceImpl(
        providers: [
          appConfigHeaderProvider,
          languageHeaderProvider,
          systemHeaderProvider,
        ],
      );
}
