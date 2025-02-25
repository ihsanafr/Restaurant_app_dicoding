import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:restaurant_app/data/model/restaurant_detail_response.dart';
import 'package:restaurant_app/data/model/restaurant_list_response.dart';
import 'package:restaurant_app/data/model/restaurant_search_response.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  final baseUrl = 'https://restaurant-api.dicoding.dev';


  Future<RestaurantDetailResponse> getRestaurantDetail(id) async {
    final response = await http
        .get(Uri.parse('$baseUrl/detail/$id'))
        .timeout(const Duration(seconds: 30));
    if (response.statusCode == 200) {
      return RestaurantDetailResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Restaurant Detail');
    }
  }
  Future<RestaurantSearchResponse> getRestaurantSearch(query) async {
    final response = await http
        .get(Uri.parse('$baseUrl/search?q=$query'))
        .timeout(const Duration(seconds: 30));
    if (response.statusCode == 200) {
      return RestaurantSearchResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to search Restaurants');
    }
  }

  Future<RestaurantListResponse> getRestaurantList() async {
    final response = await http
        .get(Uri.parse('$baseUrl/list'))
        .timeout(const Duration(seconds: 30));
    if (response.statusCode == 200) {
      return RestaurantListResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Restaurant List');
    }
  }

  Future deleteImageFile(fileName) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$fileName';
      final file = File(filePath);
      await file.exists() ? file.delete() : null;
    } catch (e) {
      throw Exception('Failed to delete image file');
    }
  }

  Future getByteArrayFromUrl(url) async {
    final response =
        await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
    return response.bodyBytes;
  }

  Future downloadAndSaveImageFile(url, fileName) async {
    try {
      final bytes = await getByteArrayFromUrl(url);
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$fileName';
      final file = File(filePath);
      await file.writeAsBytes(bytes);
      return filePath;
    } catch (e) {
      return '';
    }
  }
}
