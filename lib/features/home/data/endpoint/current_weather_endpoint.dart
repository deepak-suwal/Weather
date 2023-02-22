import 'package:rest_client/flutter_rest_client.dart';

class CurrentWeatherEndpoint implements IRequestEndPoint {
  final String query;

  CurrentWeatherEndpoint(this.query);

  @override
  RequestMethod method = RequestMethod.GET;

  @override
  String get url => 'current.json?q=$query';
}
