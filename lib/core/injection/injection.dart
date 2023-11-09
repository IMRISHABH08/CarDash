import 'package:get_it/get_it.dart';
import 'package:webelight/catalog/data/datasource/catalog_datasource.dart';
import 'package:webelight/catalog/data/repository/catalog_repository_impl.dart';
import 'package:webelight/catalog/domain/repository/catalog_repository.dart';

import '../../catalog/domain/usecase/catalog_usecase.dart';

// REGISTER-SERIVCES
void registerOnAppStartUpServices() {
  _initCatalog();
}

void _initCatalog() {
  GetIt.I
      .registerLazySingleton<CatalogDataSource>(() => CatalogDataSourceImpl());
  GetIt.I.registerLazySingleton<CatalogRepository>(
      () => CatalogRepositoryImpl(client: GetIt.I.get()));
  GetIt.I.registerLazySingleton<CatalogUsecase>(
      () => CatalogUsecaseImpl(repo: GetIt.I.get()));
}

//UN-REGISTER SERVICES
void unRegisterOnAppStartUpServices() {
  _unRegisterCatalog();
}

void _unRegisterCatalog() {
  _unregister<CatalogDataSource>();
  _unregister<CatalogRepository>();
  _unregister<CatalogUsecase>();
}

void _unregister<T extends Object>({String? instanceName}) {
  if (GetIt.I.isRegistered<T>(instanceName: instanceName)) {
    GetIt.I.unregister<T>(instanceName: instanceName);
  }
}
