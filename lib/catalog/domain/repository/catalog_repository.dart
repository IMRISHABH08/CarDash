import '../entities/catalog.dart';

abstract class CatalogRepository {
  Future<CatalogData?> fetchCarList();
}
