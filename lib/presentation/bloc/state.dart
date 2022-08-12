import 'package:equatable/equatable.dart';
import 'package:flutter_custom_animation/presentation/bloc/status.dart';

abstract class AppBlocState with EquatableMixin {
  final Object? error;
  final BlocStatus status;

  const AppBlocState({required this.status, this.error});


  @override
  List<Object?> get props => <Object?>[
    error,
    status,
  ];
}
