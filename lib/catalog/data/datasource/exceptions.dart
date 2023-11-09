import 'package:equatable/equatable.dart';

class NotFoundException extends Equatable implements Exception {
  const NotFoundException({required this.message});
  final Object message;
  @override
  List<Object?> get props => [message];
}

class SomethingWentWrongException extends Equatable implements Exception {
  const SomethingWentWrongException({required this.message});
  final Object message;
  @override
  List<Object?> get props => [message];
}

class ServerException extends Equatable implements Exception {
  const ServerException({required this.message});
  final Object message;
  @override
  List<Object?> get props => [message];
}
