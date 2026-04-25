// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:products_app/core/di/modules/network_module.dart' as _i58;
import 'package:products_app/data/data.dart' as _i784;
import 'package:products_app/data/data_sources/local/favorites/favorites_local_data_source.dart'
    as _i533;
import 'package:products_app/data/data_sources/local/favorites/favorites_local_data_source_impl.dart'
    as _i268;
import 'package:products_app/data/repositories/products/products_repository_impl.dart'
    as _i660;
import 'package:products_app/domain/products/use_cases/toggle_favorite_use_case.dart'
    as _i920;
import 'package:products_app/presentation/home/blocs/home_bloc.dart' as _i827;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio());
    gh.lazySingleton<_i533.FavoritesLocalDataSource>(
      () => _i268.FavoritesLocalDataSourceImpl(),
    );
    gh.lazySingleton<_i784.ProductsRemoteDataSource>(
      () => networkModule.productsRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i784.ProductsRepository>(
      () => _i660.ProductsRepositoryImpl(
        gh<_i784.ProductsRemoteDataSource>(),
        gh<_i784.FavoritesLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i920.ToggleFavoriteUseCase>(
      () => _i920.ToggleFavoriteUseCase(gh<_i784.ProductsRepository>()),
    );
    gh.factory<_i827.HomeBloc>(
      () => _i827.HomeBloc(gh<_i784.ProductsRepository>()),
    );
    return this;
  }
}

class _$NetworkModule extends _i58.NetworkModule {}
