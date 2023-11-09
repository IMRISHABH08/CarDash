import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webelight/catalog/domain/entities/catalog.dart';
import 'package:webelight/catalog/domain/usecase/catalog_usecase.dart';

import '../../domain/entities/car_data.dart';

class CatalogController {
  CatalogController({required CatalogUsecase usecase}) : _usecase = usecase {
    init();
  }

  final isLaoding = false.obs;

  final CatalogUsecase _usecase;
  late final CatalogData? catalogData;

  final currentSelectedCar =
      const CarData(name: '', model: '', detailsUrl: '').obs;

  init() {
    fetchCarsData();
  }

  Future<void> fetchCarsData() async {
    updateState(true);
    try {
      final result = await _usecase.fetchCarList();
      if (result != null) catalogData = result;
    } catch (_) {
      catalogData = null;
      debugPrint(_.toString());
    } finally {
      updateState(false);
    }
  }

  void updateState(bool val) => isLaoding(val);

  CatalogData? get getCatalog => catalogData;

  void setCurrentCar(CarData car) => currentSelectedCar.value = car.copyWith();

  void dispose() {
    isLaoding.close();
    currentSelectedCar.close();
  }
}
