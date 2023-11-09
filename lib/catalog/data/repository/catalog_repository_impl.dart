import 'package:webelight/catalog/data/datasource/catalog_datasource.dart';
import 'package:webelight/catalog/domain/repository/catalog_repository.dart';

import '../../domain/entities/catalog.dart';

class CatalogRepositoryImpl extends CatalogRepository {
  CatalogRepositoryImpl({required CatalogDataSource client}) : _client = client;

  final CatalogDataSource _client;

  @override
  Future<CatalogData?> fetchCarList() {
    return _client.fetchCarList();
  }
}
