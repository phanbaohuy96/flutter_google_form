import 'dart:async';

import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart' hide Order;

import '../../../../../data/models/form.dart';
import '../../../../base/base.dart';
import '../interactor/dynamic_form_detail_interactor.dart';

part 'dynamic_form_detail_bloc.freezed.dart';
part 'dynamic_form_detail_event.dart';
part 'dynamic_form_detail_state.dart';

@Injectable()
class DynamicFormDetailBloc
    extends AppBlocBase<DynamicFormDetailEvent, DynamicFormDetailState> {
  final DynamicFormDetailInteractor _interactor;

  DynamicFormDetailBloc(
    @factoryParam DynamicForm? data,
    this._interactor,
  ) : super(
          DynamicFormDetailInitial(
            viewModel: _ViewModel(
              data: data,
              composingResponses: data.let(
                (it) {
                  final elements = [...?it?.elements];
                  if (elements.isEmpty) {
                    return {};
                  }
                  return _interactor.generateComposingResponse(
                    data!,
                    {},
                  );
                },
              ),
            ),
          ),
        ) {
    on<GetDynamicFormDetailEvent>(_onGetDynamicFormDetailEvent);
    on<UpdateComposingResponseEvent>(_onUpdateComposingResponseEvent);
    on<SubmitResponseEvent>(_onSubmitResponseEvent);
    on<ResetSubmitStateEvent>(_onResetSubmitStateEvent);
  }

  Future<void> _onGetDynamicFormDetailEvent(
    GetDynamicFormDetailEvent event,
    Emitter<DynamicFormDetailState> emit,
  ) async {
    final [
      data as DynamicForm?,
      responses as List<DynamicFormResponse>,
    ] = await Future.wait(
      [
        _interactor.getDynamicFormDetail(event.id),
        _interactor.getFormRespoinses(event.id),
      ],
      eagerError: true,
    );

    emit(
      state.copyWith(
        viewModel: state.viewModel.copyWith(
          data: data,
          responses: responses,
          composingResponses: _interactor.generateComposingResponse(
            data ?? const DynamicForm(),
            state.composingResponses,
          ),
        ),
      ),
    );
  }

  FutureOr<void> _onUpdateComposingResponseEvent(
    UpdateComposingResponseEvent event,
    Emitter<DynamicFormDetailState> emit,
  ) {
    final composingResponses = {
      ...state.composingResponses,
      event.element.id: event.response,
    };

    emit(
      state.copyWith(
        viewModel: state.viewModel.copyWith(
          composingResponses: composingResponses,
        ),
      ),
    );
  }

  FutureOr<void> _onSubmitResponseEvent(
    SubmitResponseEvent event,
    Emitter<DynamicFormDetailState> emit,
  ) async {
    final formId = state.data?.id;
    if (formId.isNullOrEmpty) {
      throw Exception('Form not be found');
    }
    final res = await _interactor.submitResponse(
      formId!,
      state.composingResponses,
    );

    final responses = await _interactor.getFormRespoinses(formId);

    if (res) {
      emit(
        state.copyWith<SubmitResponseSuccess>(
          viewModel: state.viewModel.copyWith(
            responses: responses,
            composingResponses: _interactor.generateComposingResponse(
              state.data ?? const DynamicForm(),
              {},
            ),
          ),
        ),
      );
    }
  }

  FutureOr<void> _onResetSubmitStateEvent(
    ResetSubmitStateEvent event,
    Emitter<DynamicFormDetailState> emit,
  ) {
    emit(
      state.copyWith<DynamicFormDetailInitial>(
        viewModel: state.viewModel.copyWith(
          composingResponses: _interactor.generateComposingResponse(
            state.data ?? const DynamicForm(),
            {},
          ),
        ),
      ),
    );
  }
}
