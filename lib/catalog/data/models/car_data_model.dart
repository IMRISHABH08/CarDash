import '../../../utils/extensions/map_functions.dart';
import '../../domain/entities/car_data.dart';

class CarDataModel extends CarData {
  const CarDataModel({
    required super.name,
    required super.model,
    required super.detailsUrl,
    required super.manufacturer,
    required super.costInCredits,
    required super.maxAtmospheringSpeed,
    required super.crew,
    required super.passengers,
    super.length,
    super.cargoCapacity,
    super.consumables,
    super.vehicleClass,
    super.pilots,
    super.films,
    super.created,
    super.edited,
  });

  factory CarDataModel.fromJson(Json json) {
    return CarDataModel(
        name: json['name']?.toString() ?? '',
        model: json['model']?.toString() ?? '',
        manufacturer: json['manufacturer']?.toString() ?? '',
        costInCredits: json['cost_in_credits']?.toString() ?? '',
        length: json['length']?.toString() ?? '',
        maxAtmospheringSpeed: json['max_atmosphering_speed']?.toString() ?? '',
        crew: json['crew']?.toString() ?? '',
        passengers: json['passengers']?.toString() ?? '',
        cargoCapacity: json['cargo_capacity']?.toString() ?? '',
        consumables: json['consumables']?.toString() ?? '',
        vehicleClass: json['vehicle_class']?.toString() ?? '',
        created: json['created']?.toString() ?? '',
        edited: json['edited']?.toString() ?? '',
        detailsUrl: json['url']?.toString() ?? '',
        pilots: json.asList<String>('pilots'),
        films: json.asList<String>('films'));
  }
}
