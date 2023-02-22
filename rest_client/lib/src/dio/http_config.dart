abstract class IHttpConfig {
  String get baseUrl;

  late String key;

  late int connectionTimeout;
  late int receiveTimeout;
  late String contentType;

  late bool dioLogger;
  late bool curlLogger;
}
