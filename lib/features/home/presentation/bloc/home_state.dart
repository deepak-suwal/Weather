part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class CurrentWeatherFetchingState extends HomeState {}

class CurrentWeatherFetchingSuccessState extends HomeState {
  final CurrentWeatherModel currentWeatherModel;

  CurrentWeatherFetchingSuccessState(this.currentWeatherModel);
}

class CurrentWeatherFetchingFailureState extends HomeState {
  final Error error;

  CurrentWeatherFetchingFailureState(this.error);
}

class SearchLocationFetchingState extends HomeState {}

class SearchLocationFetchingSuccessState extends HomeState {
  final List<SearchModel> searchModel;

  SearchLocationFetchingSuccessState(this.searchModel);
}

class SearchLocationFetchingFailureState extends HomeState {
  final String error;

  SearchLocationFetchingFailureState(this.error);
}
