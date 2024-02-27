import 'package:flutter/material.dart';
import 'package:softronictask/model/data_model.dart';
import 'package:softronictask/service/api_service.dart';


class ApiProvider extends ChangeNotifier {
  ApiService service = ApiService();
  Future<List<DataModel>> getDatas() async {
    try {
      return await service.getDatas();
    } catch (e) {
      throw Exception("Error occurred while fetching data: $e");
    }
  }
}
