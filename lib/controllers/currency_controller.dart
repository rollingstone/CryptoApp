import 'dart:developer';

import 'package:crypto/controllers/Currency.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';

class CurrencyController extends GetxController {
  var _currencyList = <Currency>[
    Currency(
        name: 'Bitcoin',
        rate: 39861.80,
        logoUrl:
            'https://res.cloudinary.com/dxo0jqzkk/image/upload/v1649323929/bitcoin.png'),
    Currency(
        name: 'Ethereum',
        rate: 39861.80,
        logoUrl:
            'https://res.cloudinary.com/dxo0jqzkk/image/upload/c_scale,h_100/v1649343886/Ethereum.png'),
    Currency(
        name: 'Tether',
        rate: 39861.80,
        logoUrl:
            'https://res.cloudinary.com/dxo0jqzkk/image/upload/c_scale,h_100/v1649343986/Tether.png'),
    Currency(
        name: 'Solana',
        rate: 39861.80,
        logoUrl:
            'https://res.cloudinary.com/dxo0jqzkk/image/upload/c_scale,h_100/v1649344046/solana.png'),
  ].obs;

  get actifCurrencies {
    return _currencyList.where((i) => i.isAdded).toList();
  }

  get notactifCurrencies {
    return _currencyList.where((i) => !i.isAdded).toList();
  }

  void updateIsAdded(List<String> currenciesNames) {
    List<Currency> newList = [];

    _currencyList.forEach((currency) {
      if (currenciesNames.contains(currency.name)) {
        currency.isAdded = true;
        print('add is added');
      } else {
        currency.isAdded = false;
      }
      newList.add(currency);
    });
    _currencyList.clear();
    _currencyList.value = newList;
    update();
    inspect(_currencyList);
  }
}
