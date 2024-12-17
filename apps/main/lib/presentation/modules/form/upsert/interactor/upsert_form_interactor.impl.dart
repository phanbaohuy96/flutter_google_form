part of 'upsert_form_interactor.dart';

@Injectable(as: UpsertFormInteractor)
class UpsertFormInteractorImpl extends UpsertFormInteractor {
  final UpsertFormRepository _repository;

  UpsertFormInteractorImpl(this._repository);

  @override
  Future<DynamicForm> saveForm(DynamicForm form) {
    return _repository.saveForm(form);
  }
}
