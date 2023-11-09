import 'dart:convert';
import 'dart:io';

import 'package:webelight/catalog/data/datasource/exceptions.dart';
import 'package:webelight/utils/extensions/map_functions.dart';

import '../models/catalog_model.dart';
import 'package:http/http.dart' as http;

abstract class CatalogDataSource {
  Future<CatalogDataModel?> fetchCarList();
}

class CatalogDataSourceImpl extends CatalogDataSource {
  @override
  Future<CatalogDataModel?> fetchCarList() async {
    try {
      final url = Uri.https('swapi.dev', '/api/vehicles', {'page': '1'});
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body) as Json? ?? emptyJson;
        return CatalogDataModel.fromJson(decoded);
      } else if (response.statusCode == 400) {
        throw const NotFoundException(message: 'Please Check your request');
      } else if (response.statusCode == 500) {
        throw const ServerException(message: 'Server is Down');
      }
    } catch (_) {
      throw const SomethingWentWrongException(message: 'Something Went Wrong');
    }
    return null;
  }
}
