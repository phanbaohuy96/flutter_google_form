import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../../../l10n/generated/app_localizations.dart';
import '../../../../base/base.dart';
import '../../../../extentions/extention.dart';
import '../bloc/form_listing_bloc.dart';

part 'form_listing.action.dart';

class FormListingScreen extends StatefulWidget {
  static String routeName = '/form_listing';

  const FormListingScreen({Key? key}) : super(key: key);

  @override
  State<FormListingScreen> createState() => _FormListingScreenState();
}

class _FormListingScreenState extends StateBase<FormListingScreen> {
  final _refreshController = RefreshController(initialRefresh: true);

  @override
  FormListingBloc get bloc => BlocProvider.of(context);

  late ThemeData _themeData;

  TextTheme get textTheme => _themeData.textTheme;

  late AppLocalizations trans;

  @override
  void hideLoading() {
    _refreshController
      ..refreshCompleted()
      ..loadComplete();
    super.hideLoading();
  }

  @override
  Widget build(BuildContext context) {
    _themeData = context.theme;
    trans = translate(context);
    return ScreenForm(
      title: trans.formListing,
      child: BlocConsumer<FormListingBloc, FormListingState>(
        listener: _blocListener,
        builder: (context, state) {
          return _buildListing(state);
        },
      ),
    );
  }

  Widget _buildListing(FormListingState state) {
    return SmartRefresherWrapper(
      enablePullDown: true,
      enablePullUp: state.canLoadMore,
      onLoading: loadMore,
      onRefresh: onRefresh,
      controller: _refreshController,
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final form = state.data[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    form.title ?? trans.untitledForm,
                    style: textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        form.createdAt?.toLocalDddmmyyyy(
                              locale: context.appDateLocale,
                            ) ??
                            '',
                      ),
                      const Spacer(),
                      Text(
                        '${form.elements?.length} ${trans.questions}',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16);
        },
        itemCount: state.data.length,
      ),
    );
  }
}
