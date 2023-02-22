import 'package:dio/dio.dart';
import '../http_config.dart';

class RequestInterceptor {
  final IHttpConfig config;

  RequestInterceptor(this.config);

  InterceptorsWrapper getInterceptor() {
    return InterceptorsWrapper(onRequest: (RequestOptions options,
        RequestInterceptorHandler requestInterceptorHandler) async {
      return Future.value(onRequest(options, requestInterceptorHandler));
    });
  }

  Object onRequest(RequestOptions options,
      RequestInterceptorHandler requestInterceptorHandler) async {
    options.contentType = config.contentType;
    options.baseUrl = config.baseUrl;
    requestInterceptorHandler.next(options);
    return options;
  }
}

