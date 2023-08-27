import 'package:dio/dio.dart';
import '/app/app_restful.dart';

AppRestFull appRest = AppRestFull();

class ApiConstructor {
  final dio = Dio();
  final urlRest = appRest.urlRest;
  Map<String, Type> fieldTypes = {};

  Future<Map<String, Type>> createCollection() async {
    final response = await dio.get(urlRest);
    final data = response.data;
    final collection = data['collection'];

    for (var map in collection) {
      for (var entry in map.entries) {
        var key = entry.key.toString();
        var value = entry.value;
        if (!fieldTypes.containsKey(key)) {
          fieldTypes[key] = value.runtimeType;
        }
      }
    }

    return fieldTypes;
  }
}
