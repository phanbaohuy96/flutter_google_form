import 'dart:async';

import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart' hide Order;

import '../../../../../data/models/form.dart';
import '../../../../base/base.dart';
import '../interactor/form_listing_interactor.dart';

part 'form_listing_bloc.freezed.dart';
part 'form_listing_event.dart';
part 'form_listing_state.dart';

@Injectable()
class FormListingBloc extends AppBlocBase<FormListingEvent, FormListingState> {
  final FormListingInteractor _interactor;

  FormListingBloc(this._interactor)
      : super(FormListingInitial(viewModel: const _ViewModel())) {
    on<GetFormsEvent>(_onGetFormsEvent);
    on<LoadMoreFormsEvent>(_onLoadMoreFormsEvent);
  }

  Future<void> _onGetFormsEvent(
    GetFormsEvent event,
    Emitter<FormListingState> emit,
  ) async {
    final data = await _interactor.getData();
    emit(
      state.copyWith<FormListingInitial>(
        viewModel: state.viewModel.copyWith(
          data: data,
          canLoadMore: _interactor.pagination.canNext,
        ),
      ),
    );
  }

  Future<void> _onLoadMoreFormsEvent(
    LoadMoreFormsEvent event,
    Emitter<FormListingState> emit,
  ) async {
    final moreData = await _interactor.loadMoreData();
    emit(
      state.copyWith<FormListingInitial>(
        viewModel: state.viewModel.copyWith(
          data: [...state.viewModel.data, ...moreData],
          canLoadMore: _interactor.pagination.canNext,
        ),
      ),
    );
  }
}
