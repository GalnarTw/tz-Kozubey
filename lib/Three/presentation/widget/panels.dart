import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tz/assets/colors/colors.dart';

class Panels extends StatefulWidget {
  final String title;
  const Panels({super.key, required this.title});
  @override
  State<Panels> createState() => _PanelsState();
}

final bidthMask = MaskTextInputFormatter(mask: '##.##.####');
final passportMask = MaskTextInputFormatter(mask: '## #######');
final dataMask = MaskTextInputFormatter(mask: '##.##.#### - ##.##.####');
bool _expanded = false;

class _PanelsState extends State<Panels> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          color: colorWhite, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Container(
            height: 58,
            decoration: BoxDecoration(
                color: colorWhite, borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                  ),
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                        color: colorBlack,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'SF-Pro-Display'),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _expanded = !_expanded;
                    setState(() {});
                  },
                  child: Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                        color: colorBlueLight,
                        borderRadius: BorderRadius.circular(7)),
                    child: _expanded
                        ? const Icon(Icons.expand_less, color: colorBlue)
                        : const Icon(Icons.expand_more, color: colorBlue),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: _expanded,
            child: Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                        color: colorGreyLight,
                        borderRadius: BorderRadius.circular(12)),
                    height: 52,
                    width: 343,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.sentences,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r'[\d]+'))
                        ],
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Имя',
                          labelStyle: TextStyle(
                              color: colorGrey,
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'SF-Pro-Display'),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                        color: colorGreyLight,
                        borderRadius: BorderRadius.circular(12)),
                    height: 52,
                    width: 343,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: TextField(
                        keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.sentences,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r'[\d]+'))
                        ],
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Фамилия',
                          labelStyle: TextStyle(
                              color: colorGrey,
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'SF-Pro-Display'),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                        color: colorGreyLight,
                        borderRadius: BorderRadius.circular(12)),
                    height: 52,
                    width: 343,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: TextField(
                        inputFormatters: [bidthMask],
                        keyboardType: TextInputType.number,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Дата рождения',
                          labelStyle: TextStyle(
                              color: colorGrey,
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'SF-Pro-Display'),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                        color: colorGreyLight,
                        borderRadius: BorderRadius.circular(12)),
                    height: 52,
                    width: 343,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: TextField(
                        keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Гражданство',
                          labelStyle: TextStyle(
                              color: colorGrey,
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'SF-Pro-Display'),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                        color: colorGreyLight,
                        borderRadius: BorderRadius.circular(12)),
                    height: 52,
                    width: 343,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: TextFormField(
                        inputFormatters: [passportMask],
                        keyboardType: TextInputType.number,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Номер загранпаспорта',
                          labelStyle: TextStyle(
                              color: colorGrey,
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'SF-Pro-Display'),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                        color: colorGreyLight,
                        borderRadius: BorderRadius.circular(12)),
                    height: 52,
                    width: 343,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: TextField(
                        inputFormatters: [dataMask],
                        keyboardType: TextInputType.number,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Срок действия загранпаспорта',
                          labelStyle: TextStyle(
                              color: colorGrey,
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'SF-Pro-Display'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
