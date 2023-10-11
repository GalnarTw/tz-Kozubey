import 'package:flutter/material.dart';
import 'package:tz/assets/colors/colors.dart';
import 'package:tz/second/presentation/widget/hotel.dart';
const indexHotel=0;
class Second extends StatelessWidget {
  const Second({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: colorBlack,
                size: 20,
              )),
        ),
        automaticallyImplyLeading: false,
        title: const Text(
          'Steigenberger Makadi',
          style: TextStyle(color: Colors.black, fontFamily: 'SF-Pro-Display'),
        ),
        backgroundColor: colorWhite,
      ),
      backgroundColor: colorGreyLight,
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return  Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Hotel(indexHotel: index),
              ),
            ],
          );
        },
      ),
    );
  }
}
