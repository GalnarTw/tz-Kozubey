import 'package:flutter/material.dart';
import 'package:tz/assets/colors/colors.dart';

Widget aboutHotel(String hotelInfo) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    child: Text(
      hotelInfo,
      style: const TextStyle(
          fontFamily: 'SF-Pro-Display',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: colorGrey),
    ),
  );
}
