import 'package:flutter/material.dart';

Widget cart(String hotelPhoto) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          height: 257,
          width: 343,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              hotelPhoto,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    ),
  );
}
