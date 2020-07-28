import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:nt_flutter/model/travel_model.dart';
const URL = "http://localhost:4000/api/trip/get?uid=1";

class TravelDao{
  static Future<TravelModel> fetch() async{
    final response = await Dio().get(URL);
    print(response);
    if (response.statusCode == 200) {
      return TravelModel.fromJson(json.decode(response.data));
    } else {
      throw Exception('Failed to load home_page.json');
    }
  }
}