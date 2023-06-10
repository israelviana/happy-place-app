import 'package:dio/dio.dart';
import '../models/api_animal_model.dart';

class ApiAnimalRepository{
  Future<List<ApiAnimalModel>> getApiCat() async {
    final dio = Dio();
    final response = await dio.get('https://api.thecatapi.com/v1/images/search?limit=30');
    List<ApiAnimalModel> catsList = [];
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      catsList = data.map((json) => ApiAnimalModel.fromJson(json)).toList();
    } else {
      throw Exception('Falha na req');
    }
    return catsList;
  }

  Future<List<ApiAnimalModel>> getApiDog() async {
    final dio = Dio();
    final response = await dio.get('https://api.thedogapi.com/v1/images/search?limit=30');
    List<ApiAnimalModel> dogsList = [];
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      dogsList = data.map((json) => ApiAnimalModel.fromJson(json)).toList();
    } else {
      throw Exception('Falha na req');
    }
    return dogsList;
  }
}