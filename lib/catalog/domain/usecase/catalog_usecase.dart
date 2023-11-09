import '../entities/catalog.dart';
import '../repository/catalog_repository.dart';

abstract class CatalogUsecase {
  Future<CatalogData?> fetchCarList();
}

class CatalogUsecaseImpl extends CatalogUsecase {
  CatalogUsecaseImpl({required CatalogRepository repo}) : _repository = repo;

  final CatalogRepository _repository;

  @override
  Future<CatalogData?> fetchCarList() {
    return _repository.fetchCarList();
  }
}
