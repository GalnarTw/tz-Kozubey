import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tz/Three/presentation/screen.dart';
import 'package:tz/assets/colors/colors.dart';
import 'package:tz/second/data/model.dart';
import 'package:tz/second/presentation/bloc/cubit_state.dart';
import 'package:tz/second/presentation/widget/cart.dart';
import 'package:tz/second/presentation/widget/peculiarities.dart';
import '../bloc/cubit.dart';

int activeIndex = 0;

class Hotel extends StatefulWidget {
  final int indexHotel;
  const Hotel({super.key, required this.indexHotel});

  @override
  State<Hotel> createState() => _HotelState();
}

class _HotelState extends State<Hotel> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SecondCubit, SecondCubitState>(
      builder: (context, state) {
        List<SecondModel> secondList = [];
        if (state is SecondLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SecondLoaded) {
          secondList = state.secondModelList;
        } else if (state is SecondEmpty) {}
        return Container(
          decoration: BoxDecoration(
              color: colorWhite, borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              CarouselSlider.builder(
                itemCount:
                    secondList[0].rooms![widget.indexHotel].imageUrls!.length,
                options: CarouselOptions(
                  height: 257,
                  aspectRatio: 1.5,
                  viewportFraction: 0.95,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) =>
                      setState(() => activeIndex = index),
                ),
                itemBuilder: (context, index, realIndex) {
                  Widget indicator() => AnimatedSmoothIndicator(
                        activeIndex: activeIndex,
                        effect: const ScrollingDotsEffect(
                            activeDotScale: 1,
                            dotWidth: 7,
                            dotHeight: 7,
                            paintStyle: PaintingStyle.fill,
                            strokeWidth: 1.5,
                            dotColor: colorGrey,
                            activeDotColor: colorBlack),
                        count: secondList[0]
                            .rooms![widget.indexHotel]
                            .imageUrls!
                            .length,
                      );
                  return Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      cart(secondList[0]
                          .rooms![widget.indexHotel]
                          .imageUrls![index]),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: colorWhite,
                          ),
                          margin: const EdgeInsets.only(bottom: 15),
                          width: 75,
                          height: 17,
                          child: indicator()),
                    ],
                  );
                },
              ),
              Container(
                margin: const EdgeInsets.only(left: 16, top: 8, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${secondList[0].rooms![widget.indexHotel].name}',
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    Container(
                      height: 47,
                      width: 360,
                      color: colorWhite,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: secondList[0]
                              .rooms![widget.indexHotel]
                              .peculiarities!
                              .length,
                          itemBuilder: (context, index) {
                            return aboutHotel(
                              secondList[0]
                                  .rooms![widget.indexHotel]
                                  .peculiarities![index],
                            );
                          }),
                    ),
                    Container(
                      height: 29,
                      width: 192,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: colorBlueLight),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 6, right: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Подробнее о номере',
                              style: TextStyle(
                                color: colorBlue,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'SF-Pro-Display',
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: colorBlue,
                              size: 16,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${cell(secondList[0].rooms![widget.indexHotel].price.toString())}₽',
                            style: const TextStyle(
                              fontFamily: 'SF-Pro-Display',
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              '${secondList[0].rooms![widget.indexHotel].pricePer}',
                              style: const TextStyle(
                                  fontFamily: 'SF-Pro-Display',
                                  color: colorGrey,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 1, left: 16, right: 16, bottom: 16),
                child: Container(
                  height: 48,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: colorBlue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Three()),
                      );
                    },
                    child: const Text(
                      'Выбрать номер',
                      style: TextStyle(
                          color: colorWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'SF-Pro-Display'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

String cell(String price) {
  String result = price;
  if (price.length == 4) {
    result = result.replaceRange(1, 4, ' ') + result.replaceRange(0, 1, '');
  }
  if (price.length == 5) {
    result = result.replaceRange(2, 5, ' ') + result.replaceRange(0, 2, '');
  }
  if (price.length == 6) {
    result = result.replaceRange(3, 6, ' ') + result.replaceRange(0, 3, '');
  }
  if (price.length == 7) {
    result =
        '${result.substring(0, 1)} ${result.substring(1, 4)} ${result.substring(4, 7)}';
  }
  return result;
}
