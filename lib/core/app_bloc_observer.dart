import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('СОЗДАН: ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('ПЕРЕХОД: $bloc\n      ТЕКУЩЕЕ: ${change.currentState}\n      СЛЕДУЮЩЕЕ:${change.nextState}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('СОБЫТИЕ: ${bloc.runtimeType} обрабатывает $event');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('ОШИБКА: ${bloc.runtimeType} $error');
    super.onError(bloc, error, stackTrace);
  }
}
