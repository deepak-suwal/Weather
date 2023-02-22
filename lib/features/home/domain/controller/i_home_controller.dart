import 'package:injectable/injectable.dart';
import 'package:weather/features/home/domain/repository/i_home_repository.dart';

import '../../data/model/current_weather_model.dart';
import '../../data/model/search_model.dart';

abstract class IHomeController {
  Future<CurrentWeatherModel> getCurrentWeather(String query);

  Future<List<SearchModel>> searchLocation(String query);
}

@Injectable(as: IHomeController)
class HomeController extends IHomeController {
  IHomeRepository repository;

  HomeController(this.repository);

  @override
  Future<CurrentWeatherModel> getCurrentWeather(String query) {
    return repository.getCurrentWeather(query);
  }

  @override
  Future<List<SearchModel>> searchLocation(String query) {
    return repository.searchLocation(query);
  }
}
