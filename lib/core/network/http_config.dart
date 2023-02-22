import 'package:injectable/injectable.dart';
import 'package:rest_client/flutter_rest_client.dart';

import '../../config/app_config.dart';
import '../constants/app_keys.dart';

@Named('httpConfig')
@Singleton(as: IHttpConfig)
class HttpConfig implements IHttpConfig {
  final AppConfig _appConfig;

  HttpConfig(this._appConfig);

  @override
  String contentType = applicationJson;

  @override
  int receiveTimeout = 8000;

  @override
  String get baseUrl => _appConfig.baseUrl;

  @override
  int connectionTimeout = 8000;

  @override
  bool curlLogger = false;

  @override
  bool dioLogger = true;

  @override
  String key = apiKey;
}
