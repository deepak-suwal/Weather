// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:rest_client/flutter_rest_client.dart' as _i4;
import 'package:weather/config/app_config.dart' as _i3;
import 'package:weather/core/injection/register_module.dart' as _i10;
import 'package:weather/core/network/http_config.dart' as _i5;
import 'package:weather/features/home/data/repository/home_repository.dart'
    as _i7;
import 'package:weather/features/home/domain/controller/i_home_controller.dart'
    as _i8;
import 'package:weather/features/home/domain/repository/i_home_repository.dart'
    as _i6;
import 'package:weather/features/home/presentation/bloc/home_bloc.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.AppConfig>(() => _i3.AppConfig());
    gh.singleton<_i4.IHttpConfig>(
      _i5.HttpConfig(gh<_i3.AppConfig>()),
      instanceName: 'httpConfig',
    );
    gh.factory<_i4.IHttpHelper>(() => registerModule
        .httpHelper(gh<_i4.IHttpConfig>(instanceName: 'httpConfig')));
    gh.factory<_i6.IHomeRepository>(
        () => _i7.HomeRepository(gh<_i4.IHttpHelper>()));
    gh.factory<_i8.IHomeController>(
        () => _i8.HomeController(gh<_i6.IHomeRepository>()));
    gh.factory<_i9.HomeBloc>(() => _i9.HomeBloc(gh<_i8.IHomeController>()));
    return this;
  }
}

class _$RegisterModule extends _i10.RegisterModule {}
