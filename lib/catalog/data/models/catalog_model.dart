

import '../../../utils/extensions/map_functions.dart';
import '../../domain/entities/catalog.dart';
import 'car_data_model.dart';

class CatalogDataModel extends CatalogData {
  const CatalogDataModel({
    super.totalCount,
    super.results = const [],
  });

  factory CatalogDataModel.fromJson(Json json) {
    return CatalogDataModel(
      totalCount: int.tryParse(json['count']?.toString() ?? '0') ?? 0,
      results: json.asList<Json>('results').map(CarDataModel.fromJson).toList(),
    );
  }
}
