import 'package:equatable/equatable.dart';

import 'car_data.dart';

class CatalogData extends Equatable {
  const CatalogData({required this.results, this.totalCount = 0});

  final int totalCount;
  final List<CarData> results;

  @override
  List<Object?> get props => [];
}
