import 'package:rest_client/flutter_rest_client.dart';

class SearchLocationEndpoint implements IRequestEndPoint {
  final String query;

  SearchLocationEndpoint(this.query);

  @override
  RequestMethod method = RequestMethod.GET;

  @override
  String get url => 'search.json?q=$query';
}
