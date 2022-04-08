import 'package:crypto/controllers/currency.dart';
import 'package:crypto/controllers/currency_controller.dart';
import 'package:crypto/widgets/add_new-currency_box.dart';
import 'package:crypto/widgets/currency_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Currency> data = [];
  CurrencyController currencyController = Get.find();

  @override
  Widget build(BuildContext context) {
    var space = MediaQuery.of(context).size.height * 0.03;
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Color(0xff405CA8), Color(0xff192879)],
      )),
      child: Stack(alignment: Alignment.bottomCenter, children: [
        Align(
          alignment: Alignment.topLeft, // and bottomLeft
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 16,
                  child: Container(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('c2',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25)),
                        SizedBox(
                          height: space,
                        ),
                        Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Text(
                                'Total crypto',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 189, 189, 189),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18),
                              ),
                            ),
                            Icon(
                              Icons.sync_alt,
                              size: 15,
                              color: Colors.grey,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(right: 10),
                              child: const Text('€',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w200,
                                      fontSize: 35)),
                            ),
                            const Text('14.200.122',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: space,
                        ),
                        const Text(
                          'ROI',
                          style: TextStyle(
                              color: Color.fromARGB(255, 189, 189, 189),
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                        const Text('31.31%',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25)),
                        SizedBox(
                          height: space,
                        ),
                        const Text('ROI last 24h',
                            style: TextStyle(
                                color: Color.fromARGB(255, 189, 189, 189),
                                fontWeight: FontWeight.w400,
                                fontSize: 18)),
                        const Text('12.200',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 16,
                  child: Obx((() {
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: currencyController.actifCurrencies.length + 1,
                      itemBuilder: (context, index) {
                        return index == 0
                            ? const AddNewCurrencyBox()
                            : CurrencyBox(
                                currency: currencyController
                                    .actifCurrencies[index - 1],
                                selectable: false,
                                onSelect: (isSelected, currencyName) {});
                      },
                    );
                  })),
                )
              ],
            ),
          ),
        ),
        IgnorePointer(
            child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment.bottomCenter,
                  image: AssetImage('assets/images/Floor.png'))),
        )),
      ]),
    );
  }
}
