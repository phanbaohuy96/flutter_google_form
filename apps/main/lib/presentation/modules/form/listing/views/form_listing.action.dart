part of 'form_listing_screen.dart';

extension FormListingAction on _FormListingScreenState {
  void _blocListener(BuildContext context, FormListingState state) {
    hideLoading();
  }

  void onRefresh() {
    bloc.add(GetFormsEvent());
  }

  void loadMore() {
    bloc.add(LoadMoreFormsEvent());
  }
}
