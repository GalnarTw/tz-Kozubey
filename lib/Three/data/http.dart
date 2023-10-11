import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';

class GetThreeUrl {
  final http.Client client = http.Client();
  Future<ThreeModel> get() async {
    final response = await client.get(
        Uri.parse("https://run.mocky.io/v3/e8868481-743f-4eb2-a0d7-2bc4012275c8"),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final threeHotel = json.decode(response.body);
         return ThreeModel.fromJson(threeHotel);
    } else {
      throw Exception();
    }
  }
}