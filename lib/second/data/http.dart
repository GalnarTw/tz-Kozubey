import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';

class GetSecondUrl {
  final http.Client client = http.Client();
  Future<SecondModel> get() async {
    final response = await client.get(
        Uri.parse("https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd"),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final secondHotel = json.decode(response.body);
         return SecondModel.fromJson(secondHotel);
    } else {
      throw Exception();
    }
  }
}