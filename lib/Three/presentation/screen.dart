import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tz/Three/data/model.dart';
import 'package:tz/Three/presentation/bloc/cubit.dart';
import 'package:tz/Three/presentation/bloc/cubit_state.dart';
import 'package:tz/Three/presentation/widget/last.dart';
import 'package:tz/Three/presentation/widget/panels.dart';
import '/assets/colors/colors.dart';

final turist = ['Первый', 'Второй', 'Третий', 'Четвертый', 'Пятый'];
final validatorNumber = GlobalKey<FormState>();
final validatorEmail = GlobalKey<FormState>();
final nuberMask = MaskTextInputFormatter(mask: '+7(###)-###-##-##');

class Three extends StatefulWidget {
  const Three({
    Key? key,
  }) : super(key: key);

  @override
  State<Three> createState() => _ThreeState();
}

class _ThreeState extends State<Three> {
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
          'Бронирование',
          style: TextStyle(color: colorBlack, fontFamily: 'SF-Pro-Display'),
        ),
        backgroundColor: colorWhite,
      ),
      backgroundColor: colorGreyLight,
      body: BlocBuilder<ThreeCubit, ThreeCubitState>(
        builder: (context, state) {
          List<ThreeModel> threeList = [];
          if (state is ThreeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ThreeLoaded) {
            threeList = state.threeModelList;
          } else if (state is ThreeEmpty) {}
          final int sum = threeList[0].serviceCharge! +
              threeList[0].tourPrice! +
              threeList[0].fuelCharge!;
          return ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: colorWhite, borderRadius: BorderRadius.circular(12)),
                margin: const EdgeInsets.only(top: 8),
                child: Container(
                  margin: const EdgeInsets.only(left: 16, top: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(decoration: BoxDecoration(color: colorYeloLight,borderRadius: BorderRadius.circular(6)),
                        height: 29,
                        width: 149,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(
                              Icons.star,
                              size: 17,
                              color: colorOrange,
                            ),
                            Text(
                              '${threeList[0].horating}',
                              style: const TextStyle(
                                  color: colorOrange,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'SF-Pro-Display'),
                            ),
                            Text(
                              '${threeList[0].ratingName}',
                              style: const TextStyle(
                                  color: colorOrange,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'SF-Pro-Display'),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 16),
                        child: Text(
                          '${threeList[0].hotelName}',
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'SF-Pro-Display'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          bottom: 8,
                        ),
                        child: Text(
                          '${threeList[0].hotelAdress}',
                          style: const TextStyle(
                              color: colorBlue,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'SF-Pro-Display'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Container(
                  decoration: BoxDecoration(
                      color: colorWhite,
                      borderRadius: BorderRadius.circular(12)),
                  child: Container(
                    margin:
                        const EdgeInsets.only(top: 16, bottom: 16, left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 375,
                          height: 280,
                          margin: const EdgeInsets.only(right: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Вылет из:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: colorGrey,
                                          fontFamily: 'SF-Pro-Display')),
                                  SizedBox(
                                    width: 172,
                                    child: Text(
                                      '${threeList[0].departure}',
                                      textDirection: TextDirection.ltr,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'SF-Pro-Display'),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Страна, город:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: colorGrey,
                                          fontFamily: 'SF-Pro-Display')),
                                  SizedBox(
                                    width: 172,
                                    child: Text(
                                        '${threeList[0].arrivalCountry}',
                                        textDirection: TextDirection.ltr,
                                        overflow: TextOverflow.clip,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'SF-Pro-Display')),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Даты:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: colorGrey,
                                          fontFamily: 'SF-Pro-Display')),
                                  SizedBox(
                                    width: 172,
                                    child: Text(
                                        '${threeList[0].tourDateStart}-${threeList[0].tourDateStop}',
                                        textDirection: TextDirection.ltr,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'SF-Pro-Display')),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Кол-во ночей:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: colorGrey,
                                          fontFamily: 'SF-Pro-Display')),
                                  SizedBox(
                                    width: 172,
                                    child: Text(
                                        '${threeList[0].numberOfNights} ночей',
                                        textDirection: TextDirection.ltr,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'SF-Pro-Display')),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Отель:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: colorGrey,
                                          fontFamily: 'SF-Pro-Display')),
                                  SizedBox(
                                    width: 172,
                                    child: Text(
                                        overflow: TextOverflow.clip,
                                        maxLines: 3,
                                        '${threeList[0].hotelName}',
                                        textDirection: TextDirection.ltr,
                                        softWrap: true,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'SF-Pro-Display')),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Номер:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: colorGrey,
                                          fontFamily: 'SF-Pro-Display')),
                                  SizedBox(
                                    width: 172,
                                    child: Text('${threeList[0].room}',
                                        textDirection: TextDirection.ltr,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'SF-Pro-Display')),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Питание:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: colorGrey,
                                          fontFamily: 'SF-Pro-Display')),
                                  SizedBox(
                                    width: 172,
                                    child: Text('${threeList[0].nutrition}',
                                        textDirection: TextDirection.ltr,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'SF-Pro-Display')),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Container(
                  decoration: BoxDecoration(
                      color: colorWhite,
                      borderRadius: BorderRadius.circular(12)),
                  child: Container(
                    margin: const EdgeInsets.only(left: 16, right: 0, top: 16),
                    width: 375,
                    height: 232,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Информация о покупателе',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'SF-Pro-Display'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Container(
                            decoration: BoxDecoration(
                                color: colorGreyLight,
                                borderRadius: BorderRadius.circular(15)),
                            height: 72,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Form(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                key: validatorNumber,
                                child: TextFormField(
                                  validator: (text) => text!.length < 17
                                      ? "Введите полный номер!"
                                      : null,
                                  inputFormatters: [nuberMask],
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'Номер Телефона',
                                    labelStyle: TextStyle(
                                        color: colorGrey,
                                        fontFamily: 'SF-Pro-Display'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Form(
                          key: validatorEmail,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16, top: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: colorGreyLight,
                                  borderRadius: BorderRadius.circular(15)),
                              height: 72,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        !value.contains('@') ||
                                        !value.contains('.')) {
                                      return 'Email, Введен некоректно';
                                    }
                                    return null;
                                  },
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'^[a-zA-Z0-9@.]+$'),
                                    )
                                  ],
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'Почта',
                                    labelStyle: TextStyle(
                                        color: colorGrey,
                                        fontFamily: 'SF-Pro-Display'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 16,
                          ),
                          height: 34,
                          width: 343,
                          child: const Text(
                            'Эти данные никому не передаются. После оплаты мы вышлем чек на указанный вами номер и почту',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: colorGrey,
                                fontFamily: 'SF-Pro-Display'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Panels(
                title: 'Первый турист',
              ),
              ...context.read<ThreeCubit>().data.map(
                    (e) => Panels(
                      title: e,
                    ),
                  ),
              context.read<ThreeCubit>().index != 4
                  ? Container(
                      margin: const EdgeInsets.only(
                        bottom: 8,
                      ),
                      height: 58,
                      decoration: BoxDecoration(
                          color: colorWhite,
                          borderRadius: BorderRadius.circular(12)),
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Добавить туриста',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'SF-Pro-Display'),
                            ),
                            TextButton(
                              onPressed: () {
                                context.read<ThreeCubit>().increase();

                                setState(() {});
                              },
                              child: Container(
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                    color: colorBlue,
                                    borderRadius: BorderRadius.circular(7)),
                                child: const Icon(
                                  Icons.add,
                                  color: colorWhite,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              Container(
                decoration: BoxDecoration(
                    color: colorWhite, borderRadius: BorderRadius.circular(12)),
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 16, right: 16, bottom: 16, top: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Тур',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: colorGrey,
                                fontFamily: 'SF-Pro-Display'),
                          ),
                          Text(
                            '${cell(threeList[0].tourPrice.toString())} ₽',
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'SF-Pro-Display'),
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Топлевный сбор',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: colorGrey,
                                fontFamily: 'SF-Pro-Display'),
                          ),
                          Text(
                            '${cell(threeList[0].fuelCharge.toString())} ₽',
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'SF-Pro-Display'),
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Сервисный сбор',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: colorGrey,
                                fontFamily: 'SF-Pro-Display'),
                          ),
                          Text(
                            '${cell(threeList[0].serviceCharge.toString())} ₽',
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'SF-Pro-Display'),
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'К оплате',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: colorGrey,
                                fontFamily: 'SF-Pro-Display'),
                          ),
                          Text(
                            '${cell(sum.toString())} ₽',
                            style: const TextStyle(
                                color: colorBlue,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'SF-Pro-Display'),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 8,
                ),
                height: 1,
                color: colorBlackLight,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: colorWhite,
                ),
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
                      if (validatorNumber.currentState!.validate() ||
                              validatorEmail.currentState!.validate()
                          ) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Last()),
                        );
                      }
                    },
                    child: const Text(
                      'Оплатить',
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
          );
        },
      ),
    );
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
