part of 'bloc.dart';

@immutable
@freezed
class HomePageEvent with _$HomePageEvent {
  const HomePageEvent._();

  const factory HomePageEvent.getInitialData() = _GetInitialDataEvent;
}
