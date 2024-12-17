import 'package:bloc/bloc.dart';

import '../../../../../data/data_source/local/local_data_manager.dart';
import '../../../../../di/di.dart';
import '../dashboard_constants.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardHome());

  void navigateTo(int idx) {
    if (idx == DashboardPage.home.index) {
      emit(DashboardHome());
    } else if (idx == DashboardPage.account.index) {
      emit(DashboardAccount());
    } else {
      assert(false, 'Page with idx $idx not found!');
    }
  }

  void markLaunched() {
    injector.get<LocalDataManager>().markLaunched();
  }

  List<DashboardState> get dashboardStates => [
        DashboardHome(),
        DashboardAccount(),
      ];
}
