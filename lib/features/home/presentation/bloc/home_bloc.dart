import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather/features/home/data/model/current_weather_model.dart';
import 'package:weather/features/home/domain/controller/i_home_controller.dart';

import '../../data/model/search_model.dart';

part 'home_event.dart';

part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  IHomeController controller;

  HomeBloc(this.controller) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is FetchCurrentWeatherEvent) {
        emit(CurrentWeatherFetchingState());
        final response = await controller.getCurrentWeather(event.query);
        if (response.error == null) {
          emit(CurrentWeatherFetchingSuccessState(response));
          return;
        }
        emit(CurrentWeatherFetchingFailureState(response.error!));
      } else if (event is SearchLocationEvent) {
        emit(SearchLocationFetchingState());
        final response = await controller.searchLocation(event.query);
        if (response != null) {
          emit(SearchLocationFetchingSuccessState(response));
          return;
        }
        emit(SearchLocationFetchingFailureState('Error occurred'));
      }
    });
  }
}
