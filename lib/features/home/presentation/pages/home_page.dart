import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:weather/core/constants/app_keys.dart';
import 'package:weather/core/injection/injection.dart';
import 'package:weather/features/home/presentation/bloc/home_bloc.dart';
import 'package:weather/features/home/presentation/pages/search_delegate.dart';
import 'package:weather/features/home/presentation/widget/waether_widget.dart';

class HomePage extends StatelessWidget {
  final HomeBloc locationBloc;
  final HomeBloc searchBloc;

  HomePage({Key? key})
      : locationBloc = getIt<HomeBloc>(),
        searchBloc = getIt<HomeBloc>(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(weather),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: MySearchDelegate(searchBloc),
              ).then((value) {
                if (value != null && value.isNotEmpty) {
                  locationBloc.add(FetchCurrentWeatherEvent(value));
                }
              });
            },
          )
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: locationBloc..add(FetchCurrentWeatherEvent(kathmandu)),
        builder: (context, state) {
          if (state is CurrentWeatherFetchingState) {
            return const CupertinoActivityIndicator().center();
          } else if (state is CurrentWeatherFetchingSuccessState) {
            return WeatherWidget(
              currentWeatherModel: state.currentWeatherModel,
            );
          } else if (state is CurrentWeatherFetchingFailureState) {
            return Text(state.error.message!).center();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
