import 'dart:async';

import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart' hide Order;

import '../../../../../data/models/form.dart';
import '../../../../base/base.dart';
import '../interactor/upsert_form_interactor.dart';

part 'upsert_form_bloc.freezed.dart';
part 'upsert_form_event.dart';
part 'upsert_form_state.dart';

@Injectable()
class UpsertFormBloc extends AppBlocBase<UpsertFormEvent, UpsertFormState> {
  final UpsertFormInteractor _interactor;

  UpsertFormBloc(
    @factoryParam DynamicForm? form,
    this._interactor,
  ) : super(
          UpsertFormInitial(
            viewModel: _ViewModel(
              form: form ??
                  DynamicForm(
                    id: const Uuid().v4(),
                    createdAt: DateTime.now(),
                  ),
            ),
          ),
        ) {
    on<UpdateFormEvent>(_onUpdateFormEvent);
    on<AddFormElementEvent>(_onAddFormElementEvent);
    on<RemoveFormElementEvent>(_onRemoveFormElementEvent);
    on<UpdateFormElementEvent>(_onUpdateFormElementEvent);
    on<SaveFormEvent>(_onSaveFormEvent);
    on<RequestForcusEvent>(_onRequestForcusEvent);
  }

  FutureOr<void> _onUpdateFormEvent(
    UpdateFormEvent event,
    Emitter<UpsertFormState> emit,
  ) {
    emit(
      state.copyWith(
        viewModel: state.viewModel.copyWith(
          form: event.form,
        ),
      ),
    );
  }

  Future<void> _onAddFormElementEvent(
    AddFormElementEvent event,
    Emitter<UpsertFormState> emit,
  ) async {
    final updatedForm = state.form.copyWith(
      elements: [
        ...state.elements,
        event.element.copyWith(
          id: const Uuid().v4(),
        ),
      ],
    );

    emit(
      state.copyWith(
        viewModel: state.viewModel.copyWith(
          form: updatedForm,
          focusedIndex: (updatedForm.elements?.length ?? 0) - 1,
        ),
      ),
    );
  }

  FutureOr<void> _onRemoveFormElementEvent(
    RemoveFormElementEvent event,
    Emitter<UpsertFormState> emit,
  ) {
    final updatedForm = state.form.copyWith(
      elements: [
        ...state.elements.where(
          (element) => element != event.element,
        ),
      ],
    );

    emit(
      state.copyWith(
        viewModel: state.viewModel.copyWith(
          form: updatedForm,
        ),
      ),
    );
  }

  Future<void> _onUpdateFormElementEvent(
    UpdateFormElementEvent event,
    Emitter<UpsertFormState> emit,
  ) async {
    final updatedForm = state.form.copyWith(
      elements: [
        ...state.elements.map(
          (element) {
            if (element == event.element) {
              return event.element;
            }
            return element;
          },
        ),
      ],
    );

    emit(
      state.copyWith(
        viewModel: state.viewModel.copyWith(
          form: updatedForm,
        ),
      ),
    );
  }

  FutureOr<void> _onSaveFormEvent(
    SaveFormEvent event,
    Emitter<UpsertFormState> emit,
  ) async {
    try {
      final res = _interactor.saveForm(state.form);
      event.completer.complete(res);
    } catch (e) {
      event.completer.complete(null);
      rethrow;
    }
  }

  FutureOr<void> _onRequestForcusEvent(
    RequestForcusEvent event,
    Emitter<UpsertFormState> emit,
  ) {
    emit(
      state.copyWith(
        viewModel: state.viewModel.copyWith(
          focusedIndex: event.index,
        ),
      ),
    );
  }
}
