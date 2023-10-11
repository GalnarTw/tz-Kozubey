import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tz/assets/colors/colors.dart';
import 'package:tz/first/presentation/widget/line.dart';
import 'package:tz/second/presentation/screen.dart';
import '../data/model.dart';
import 'bloc/cubit.dart';
import 'bloc/cubit_state.dart';
import 'widget/cart.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

int activeIndex = 0;

final class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Center(
            child: Text(
          'Отель',
          style: TextStyle(color: Colors.black, fontFamily: 'SF-Pro-Display'),
        )),
        backgroundColor: colorWhite,
      ),
      backgroundColor: colorGreyLight,
      body: BlocBuilder<FirstCubit, FirstCubitState>(
        builder: (context, state) {
          List<FirstModel> firstList = [];
          if (state is FirstLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FirstLoaded) {
            firstList = state.firstModelList;
          } else if (state is FirstEmpty) {}
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Container(
                  decoration: const BoxDecoration(
                      color: colorWhite,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12))),
                  child: Column(
                    children: [
                      CarouselSlider.builder(
                        itemCount: firstList[0].imageUrls!.length,
                        options: CarouselOptions(
                          height: 217,
                          aspectRatio: 1.25,
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
                                    activeDotColor: Colors.black),
                                count: firstList[0].imageUrls!.length,
                              );
                          return Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              cart(firstList[0].imageUrls![index]),
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
                        color: colorWhite,
                        margin: const EdgeInsets.only(bottom: 8),
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: 16,
                            top: 16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(decoration: BoxDecoration(color: colorYeloLight,borderRadius: BorderRadius.circular(6)),
                                height: 29,
                                width: 149,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 8, right: 2),
                                      child: Icon(
                                        Icons.star,
                                        size: 17,
                                        color: colorOrange,
                                      ),
                                    ),
                                    Text(
                                      '${firstList[0].rating}  ${firstList[0].ratingName}',
                                      style: const TextStyle(
                                          color: colorOrange,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'SF-Pro-Display'),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                '${firstList[0].name}',
                                style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'SF-Pro-Display'),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 16, top: 8),
                                child: Text(
                                  '${firstList[0].adress}',
                                  style: const TextStyle(
                                      color: colorBlue,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'SF-Pro-Display'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'от ${cell(firstList[0].minimalPrice.toString())} ₽',
                                      style: const TextStyle(
                                        fontFamily: 'SF-Pro-Display',
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, bottom: 4),
                                      child: Text(
                                        '${firstList[0].priceForIt}',
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
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: colorWhite, borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16, top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Об отеле',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'SF-Pro-Display',
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(
                                  bottom: 16, top: 8, left: 16, right: 16),
                              child: Text(
                                aboutNomb(
                                  firstList[0].aboutTheHotel!.peculiarities!,
                                ),
                                style: const TextStyle(
                                    fontFamily: 'SF-Pro-Display',
                                    height: 2,
                                    color: colorGrey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              )),
                          Container(
                            margin: const EdgeInsets.only(right: 16),
                            child: const Text(
                              'Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'SF-Pro-Display',
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 200,
                      color: colorWhite,
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: 32,
                          right: 32,
                          top: 28,
                        ),
                        child: Column(
                          children: [
                            line('Удобства', 'lib/assets/icon/emoji-happy.svg'),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 32),
                              height: 1,
                              color: colorBlackLight,
                            ),
                            line('Что включено',
                                'lib/assets/icon/tick-square.svg'),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 32),
                              height: 1,
                              color: colorBlackLight,
                            ),
                            line('Что не включено',
                                'lib/assets/icon/close-square.svg'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 12,
                ),
                height: 1,
                color: colorBlackLight,
              ),
              Container(
                color: colorWhite,
                child: Container(
                  height: 48,
                  margin: const EdgeInsets.only(
                      top: 12, left: 16, right: 16, bottom: 32),
                  width: 343,
                  decoration: BoxDecoration(
                    color: colorBlue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Second()),
                      );
                    },
                    child: const Text(
                      'К выбору номера',
                      style: TextStyle(
                          fontFamily: 'SF-Pro-Display',
                          color: colorWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  String aboutNomb(List<String> pg) {
    String result = '';
    pg.map((e) {
      result = '$result$e              ';
    }).toList();
    return result;
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
}
