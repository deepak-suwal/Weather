import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:weather/features/home/data/model/current_weather_model.dart';

class WeatherWidget extends StatelessWidget {
  final CurrentWeatherModel currentWeatherModel;

  const WeatherWidget({
    Key? key,
    required this.currentWeatherModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${currentWeatherModel.location?.name},${currentWeatherModel.location?.country}',
        ),
        CachedNetworkImage(
          imageUrl: 'https:${currentWeatherModel.current?.condition?.icon}',
        ),
        Text(
          '${currentWeatherModel.current?.tempC} \u2103',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          '${currentWeatherModel.current?.lastUpdated}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    ).center();
  }
}
