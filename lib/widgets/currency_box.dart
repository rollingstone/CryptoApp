import 'package:crypto/controllers/currency.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrencyBox extends StatefulWidget {
  final Currency currency;
  final bool selectable;
  final Function(bool, String) onSelect;

  const CurrencyBox(
      {required this.currency,
      key,
      required this.selectable,
      required this.onSelect})
      : super(key: key);

  @override
  State<CurrencyBox> createState() => _CurrencyBoxState();
}

class _CurrencyBoxState extends State<CurrencyBox> {
  final formatter = NumberFormat("###,###,###.0#", "en_US");
  var isSelected = false;
  @override
  Widget build(BuildContext context) {
    var currency = widget.currency;
    return GestureDetector(
      onTap: () {
        if (widget.selectable) {
          toggleSelectWidget();
        }
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: isSelected
              ? const Color.fromARGB(255, 212, 218, 252)
              : Colors.white,
        ),
        child: Column(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                currency.name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0xff192879)),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Text(
                    '€',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff192879),
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    formatter.format(currency.rate).toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xff192879)),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Holdings',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              )
            ]),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.network(
                      currency.logoUrl,
                      height: 50,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            const Text('€',
                                style: TextStyle(
                                    color: Color(0xff192879),
                                    fontWeight: FontWeight.w400)),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              formatter.format(currency.rate).toString(),
                              style: const TextStyle(
                                  color: Color(0xff192879),
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          children: const [
                            SizedBox(
                              width: 15,
                              child: Text(
                                '+',
                                style: TextStyle(
                                    color: Color(0xff389849),
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Text('€',
                                style: TextStyle(
                                    color: Color(0xff389849),
                                    fontWeight: FontWeight.w400)),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '52.122.34',
                              style: TextStyle(
                                  color: Color(0xff389849),
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void toggleSelectWidget() {
    setState(() {
      isSelected = !isSelected;
    });
    widget.onSelect(isSelected, widget.currency.name);
  }
}
