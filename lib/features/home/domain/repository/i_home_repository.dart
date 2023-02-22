import '../../data/model/current_weather_model.dart';
import '../../data/model/search_model.dart';

abstract class IHomeRepository {
  Future<CurrentWeatherModel> getCurrentWeather(String query);

  Future<List<SearchModel>> searchLocation(String query);
}
