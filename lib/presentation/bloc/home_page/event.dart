part of 'bloc.dart';

@immutable
class HomePageEvent {
  final HomePageAction action;

  HomePageEvent.getInitialData() : action = HomePageAction.GetInitialData;
}

enum HomePageAction {
  GetInitialData,
}
