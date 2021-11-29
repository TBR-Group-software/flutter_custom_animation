import 'package:flutter_custom_animation/presentation/bloc/status.dart';

class AppBlocState {
  final Object? error;
  final BlocStatus status;

  AppBlocState({required this.status, this.error});
}
