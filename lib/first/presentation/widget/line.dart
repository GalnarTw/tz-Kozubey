import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tz/assets/colors/colors.dart';

Widget line(String text, String svgpick) {
  return SizedBox(
    height: 38,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              svgpick,
              width: 24,
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text,
                      textDirection: TextDirection.ltr,
                      style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'SF-Pro-Display',
                          fontWeight: FontWeight.w500)),
                  const Text(
                    textDirection: TextDirection.ltr,
                    'Самое необходимое',
                    style: TextStyle(
                        fontFamily: 'SF-Pro-Display',
                        color: colorGrey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ],
        ),
        const Icon(Icons.arrow_forward_ios),
      ],
    ),
  );
}
