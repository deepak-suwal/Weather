import 'package:injectable/injectable.dart';
import 'package:rest_client/flutter_rest_client.dart';


@module
abstract class RegisterModule {
  @Injectable(as: IHttpHelper)
  HttpHelper httpHelper(@Named('httpConfig') IHttpConfig config) =>
      HttpHelper(config: config);

}
