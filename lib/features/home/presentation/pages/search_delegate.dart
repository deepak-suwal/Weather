import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:weather/core/constants/app_keys.dart';
import 'package:weather/features/home/presentation/bloc/home_bloc.dart';

class MySearchDelegate extends SearchDelegate<String> {
  final HomeBloc searchBloc;

  MySearchDelegate(this.searchBloc);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return query.length > 2
        ? BlocBuilder<HomeBloc, HomeState>(
            bloc: searchBloc..add(SearchLocationEvent(query)),
            builder: (context, state) {
              if (state is SearchLocationFetchingSuccessState) {
                return state.searchModel.isNotEmpty
                    ? ListView.builder(
                        itemCount: state.searchModel.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(state.searchModel[index].name!),
                            onTap: () {
                              close(context, state.searchModel[index].name!);
                            },
                          );
                        },
                      )
                    : Text(
                        notFound,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.grey.shade600,
                              fontSize: 16,
                            ),
                      ).padding(all: 8);
              } else {
                return const SizedBox();
              }
            },
          )
        : Text(
            warning,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade600,
                  fontSize: 16,
                ),
          ).padding(all: 8);
  }
}
