import 'package:equatable/equatable.dart';

class CarData extends Equatable {
  const CarData({
    required this.name,
    required this.model,
    required this.detailsUrl,
    this.manufacturer = '',
    this.costInCredits = '',
    this.maxAtmospheringSpeed = '',
    this.crew = '',
    this.passengers = '',
    this.length = '',
    this.cargoCapacity = '',
    this.consumables = '',
    this.vehicleClass = '',
    this.pilots = const [],
    this.films = const [],
    this.created = '',
    this.edited = '',
  });

  final String name;
  final String model;
  final String manufacturer;
  final String costInCredits;
  final String length;
  final String maxAtmospheringSpeed;
  final String crew;
  final String passengers;
  final String cargoCapacity;
  final String consumables;
  final String vehicleClass;
  final List<String> pilots;
  final List<String> films;
  final String created;
  final String edited;
  final String detailsUrl;

  CarData copyWith({
    String? name,
    String? model,
    String? manufacturer,
    String? costInCredits,
    String? length,
    String? maxAtmospheringSpeed,
    String? crew,
    String? passengers,
    String? cargoCapacity,
    String? consumables,
    String? vehicleClass,
    List<String> pilots = const [],
    List<String> films = const [],
    String? created,
    String? edited,
    String? detailsUrl,
  }) {
    return CarData(
      name: name ?? this.name,
      model: model ?? this.model,
      manufacturer: manufacturer ?? this.manufacturer,
      costInCredits: costInCredits ?? this.costInCredits,
      length: length ?? this.length,
      maxAtmospheringSpeed: maxAtmospheringSpeed ?? this.maxAtmospheringSpeed,
      crew: crew ?? this.crew,
      passengers: passengers ?? this.passengers,
      cargoCapacity: cargoCapacity ?? this.cargoCapacity,
      consumables: consumables ?? this.consumables,
      vehicleClass: vehicleClass ?? this.vehicleClass,
      pilots: pilots,
      films: films,
      created: created ?? this.created,
      edited: edited ?? this.edited,
      detailsUrl: detailsUrl ?? this.detailsUrl,
    );
  }

  @override
  List<Object?> get props => [];
}
