import 'bloc/bloc.dart';
import 'bloc/event.dart';
import 'bloc/state.dart';
import 'coordinator.dart';
import 'interactor/interactor.dart';
import 'interactor/interactor.impl.dart';
import 'module.dart';
import 'repository/repository.dart';
import 'repository/repository.impl.dart';
import 'route.dart';
import 'views/action.dart';
import 'views/screen.dart';

final detailModuleRes = {
  'bloc': {
    'bloc': detailModuleBloc,
    'state': detailModuleState,
    'event': detailModuleEvent,
  },
  'interactor': {
    'interactor': detailModuleInteractor,
    'interactor.impl': detailModuleInteractorImpl,
  },
  'repository': {
    'repository': detailModuleRepository,
    'repository.impl': detailModuleRepositoryImpl,
  },
  'views': {
    'screen': detailModuleScreen,
    'action': detailModuleAction,
  },
  'module': detailModule,
  'route': detailModuleRoute,
  'coordinator': detailModuleCoordinator,
};
