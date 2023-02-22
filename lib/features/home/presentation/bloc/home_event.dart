part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class FetchCurrentWeatherEvent extends HomeEvent {
  final String query;

  FetchCurrentWeatherEvent(this.query);
}

class SearchLocationEvent extends HomeEvent {
  final String query;

  SearchLocationEvent(this.query);
}
