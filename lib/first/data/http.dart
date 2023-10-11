import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';

class GetFirstUrl {
  final http.Client client = http.Client();
  Future<FirstModel> get() async {
    final response = await client.get(
        Uri.parse("https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3"),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final firstHotel = json.decode(response.body);
         return FirstModel.fromJson(firstHotel);
    } else {
      throw Exception();
    }
  }
}