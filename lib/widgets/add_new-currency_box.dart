import 'package:flutter/material.dart';

import '../controllers/currency.dart';
import 'currency_box.dart';
import 'package:crypto/controllers/currency_controller.dart';
import 'package:get/get.dart';

class AddNewCurrencyBox extends StatefulWidget {
  const AddNewCurrencyBox({Key? key}) : super(key: key);

  @override
  State<AddNewCurrencyBox> createState() => _AddNewCurrencyBoxState();
}

class _AddNewCurrencyBoxState extends State<AddNewCurrencyBox> {
  List<Currency> data = [];
  List<String> selectedCurrencies = [];
  CurrencyController currencyController = Get.find();

  @override
  void initState() {
    super.initState();
    data = currencyController.notactifCurrencies;
  }

  @override
  Widget build(BuildContext context) {
    final cardMargin = MediaQuery.of(context).size.height * 0.125;

    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(
            top: cardMargin, bottom: cardMargin, left: 15, right: 15),
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: const Color(0x50020202),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.add,
              color: Colors.white,
              size: 20,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Add New',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            )
          ],
        ),
      ),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return addCurrencyModal();
          },
        );
      },
    );
  }

  Widget addCurrencyModal() {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: SizedBox(
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                  child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return CurrencyBox(
                    currency: data[index],
                    selectable: true,
                    onSelect: (isSelected, currencyName) {
                      isSelected
                          ? selectedCurrencies.add(currencyName)
                          : selectedCurrencies.remove(currencyName);
                    },
                  );
                },
              )),
              Container(
                child: TextButton.icon(
                    style: TextButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {
                      addCurrencies(context);
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Color(0xff192879),
                    ),
                    label: const Text(
                      'add',
                      style: TextStyle(color: Color(0xff192879)),
                    )),
                margin: const EdgeInsets.only(right: 30),
              ),
            ],
          )),
      decoration: const BoxDecoration(
        color: Color(0xff192879),
      ),
    );
  }

  void addCurrencies(context) {
    currencyController.updateIsAdded(selectedCurrencies);
    Navigator.pop(context);
  }
}
