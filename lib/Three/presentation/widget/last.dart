import 'package:flutter/material.dart';
import 'package:tz/assets/colors/colors.dart';
import 'package:tz/first/presentation/screen.dart';

class Last extends StatelessWidget {
  const Last({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: colorWhite,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: colorBlack,
            )),
        automaticallyImplyLeading: false,
        title: const Text(
          'Заказ оплачен',
          style: TextStyle(
              color: colorBlack,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: 'SF-Pro-Display'),
        ),
      ),
      backgroundColor: colorWhite,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 32),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: colorGreyLight),
                  height: 94,
                  width: 94,
                  child: Image.asset('lib/assets/icon/party-popper.png'),
                ),
                const Text(
                  'Ваш заказ принят в работу',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'SF-Pro-Display'),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 16, right: 16),
                  child: const Text(
                    textAlign: TextAlign.center,
                    'Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: colorGrey,
                        fontFamily: 'SF-Pro-Display'),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
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
                        top: 12, left: 16, right: 16, bottom: 28),
                    width: 343,
                    decoration: BoxDecoration(
                      color: colorBlue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const First()),
                        );
                      },
                      child: const Text(
                        'Супер!',
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
          ],
        ),
      ),
    );
  }
}
