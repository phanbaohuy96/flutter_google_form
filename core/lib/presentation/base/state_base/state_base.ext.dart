part of 'state_base.dart';

extension StateBaseExtention on CoreStateBase {
  void hideKeyBoard() => CoreCommonFunction().hideKeyBoard(context);

  Size get device => MediaQuery.of(context).size;

  double get paddingTop => MediaQuery.of(context).padding.top;

  double get paddingBottom => MediaQuery.of(context).padding.bottom;
}

void showToast(BuildContext context, String message) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: context.themeColor.secondary,
    textColor: Colors.black,
    fontSize: 14.0,
  );
}
