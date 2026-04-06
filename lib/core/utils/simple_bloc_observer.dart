import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    if (kDebugMode) {
      log('${bloc.runtimeType} changed: ${change.currentState.runtimeType} → ${change.nextState.runtimeType}');
    }
    super.onChange(bloc, change);
  }
}
