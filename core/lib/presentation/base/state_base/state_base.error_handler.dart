part of 'state_base.dart';

extension StateBaseErrorHandlerExt on CoreStateBase {
  void _onError(ErrorData error) {
    logUtils.w(
      '''[$runtimeType] error ${error.type} [${error.message?.runtimeType}] message ${error.message}''',
    );
    if (!mounted) {
      logUtils.w('[$runtimeType] error when state disposed!');
      return;
    }

    if (errorTypeShowing == error.type) {
      return;
    }
    errorTypeShowing = error.type;

    hideLoading();
    switch (error.type) {
      case ErrorType.unauthorized:
        showLoginRequired(message: error.message);
        break;
      case ErrorType.badRequest:
        _connectivityErrorOrNot(
          orNot: () {
            if (error.statusCode != null &&
                error.statusCode! >= 500 &&
                error.statusCode! < 600) {
              showErrorDialog(coreL10n.technicalIssues);
            } else {
              onLogicError(error.message);
            }
          },
        );
        break;
      case ErrorType.timeout:
        showErrorDialog(coreL10n.connectionTimeout);
        break;
      case ErrorType.noInternet:
        _connectivityErrorOrNot(
          orNot: () {
            showErrorDialog(coreL10n.technicalIssues);
          },
        );
        break;
      case ErrorType.unknown:
        onLogicError(error.message ?? coreL10n.unknownError);
        break;
      case ErrorType.serverUnExpected:
        showErrorDialog(coreL10n.serverMaintenance);
        break;
      case ErrorType.internalServerError:
        showErrorDialog(coreL10n.technicalIssues);
        break;
      case ErrorType.restricted:
        showErrorDialog(coreL10n.requestRestricted);
        break;
      default:
        break;
    }
  }

  void _connectivityErrorOrNot({void Function()? orNot}) {
    Connectivity().checkConnectivity().then((value) {
      if (value.contains(ConnectivityResult.none)) {
        showNoInternetDialog();
      } else {
        orNot?.call();
      }
    });
  }
}
