import 'dart:async';

import 'package:core/core.dart';

import '../../../../base/base.dart';
import '../../../main/dashboard/dashboard_screen.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends AppBlocBase<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitialState()) {
    on<SplashInitialEvent>(initial);
  }

  Future<void> initial(
    SplashInitialEvent event,
    Emitter<SplashState> emitter,
  ) async {
    emitter(
      SplashFinishState(
        DashboardScreen.routeName,
      ),
    );
  }
}
