import 'package:flutter/material.dart';

Widget cart(String hotelPhoto) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(
        hotelPhoto,
        fit: BoxFit.cover,
      ),
    ),
  );
}
