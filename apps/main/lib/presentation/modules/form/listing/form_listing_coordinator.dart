import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'form_listing.dart';

extension FormListingCoordinator on BuildContext {
  Future<T?> goToFormListing<T>() async {
    return Navigator.pushNamed(
      this,
      FormListingScreen.routeName,
    ).then(asOrNull);
  }
}
