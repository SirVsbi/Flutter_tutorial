import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'Constants.dart';
import '../Model/data.dart';



Future<List<Data>> getData() async {
  final response = await http.get(url);

  return compute(parseData, response.body);
}


List<Data> parseData(String response){
  final parsed = json.decode(response).cast<Map<String, dynamic>>();

  return parsed.map<Data>((json) => Data.fromJson(json)).toList();

}


