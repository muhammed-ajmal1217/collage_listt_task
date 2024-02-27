import 'package:dio/dio.dart';
import 'package:softronictask/model/data_model.dart';

class ApiService {
  String baseUrl = "http://universities.hipolabs.com/search?name=middle";
  Dio dio = Dio();

  Future<List<DataModel>> getDatas() async {
    try {
      Response res = await dio.get(baseUrl);
      if (res.statusCode == 200) {
        List<dynamic> dataList = res.data;
        return dataList.map((data) => DataModel.fromJson(data)).toList();
      } else {
        throw Exception("Error: ${res.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
