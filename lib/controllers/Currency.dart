import 'dart:ffi';

class Currency {
  String name;
  double rate;
  String logoUrl;
  bool isAdded = false;

  Currency({
    required this.name,
    required this.rate,
    required this.logoUrl,
  });
}
