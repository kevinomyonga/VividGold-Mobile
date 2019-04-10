import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:vividgold_app/models/address_model.dart';

Future<String> _loadProduct() async{
  return await rootBundle.loadString('assets/address.json');
}

Future loadAddress() async{

  String jsonAddress = await _loadProduct();
  final jsonResponce = json.decode(jsonAddress);
  address address_model = new address.fromJson(jsonResponce);

}
