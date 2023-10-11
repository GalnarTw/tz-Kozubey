import 'package:flutter/material.dart';

Widget cart(String hotelPhoto) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      width: 385,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          hotelPhoto == ''
              ? 'https://proprikol.ru/wp-content/uploads/2020/11/kartinki-oshibki-2.jpg'
              : hotelPhoto,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Image.network(
              'https://proprikol.ru/wp-content/uploads/2020/11/kartinki-oshibki-2.jpg',
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    ),
  );
}
