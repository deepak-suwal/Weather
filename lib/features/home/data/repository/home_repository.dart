import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:rest_client/flutter_rest_client.dart';
import 'package:weather/features/home/data/endpoint/current_weather_endpoint.dart';
import 'package:weather/features/home/data/endpoint/search_location_endpoint.dart';
import 'package:weather/features/home/data/model/current_weather_model.dart';
import 'package:weather/features/home/data/model/search_model.dart';
import 'package:weather/features/home/domain/repository/i_home_repository.dart';

@Injectable(as: IHomeRepository)
class HomeRepository extends IHomeRepository {
  IHttpHelper iHttpHelper;

  HomeRepository(this.iHttpHelper);

  @override
  Future<CurrentWeatherModel> getCurrentWeather(String query) async {
    final response = await iHttpHelper.request(
        CurrentWeatherEndpoint(query), BaseRequestModel());
    return CurrentWeatherModel.fromJson(response);
  }

  @override
  Future<List<SearchModel>> searchLocation(String query) async {
    final response = await iHttpHelper.request(
        SearchLocationEndpoint(query), BaseRequestModel());
    return List<SearchModel>.from(response.map((x) => SearchModel.fromJson(x)));
  }
}
