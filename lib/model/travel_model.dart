import 'package:nt_flutter/model/day_model.dart';

class TravelModel {
  final String uid;
  final String tripName;
  final String designer;
  final List<DayDetail> dayList;

  TravelModel({
    this.uid,
    this.tripName,
    this.designer,
    this.dayList
  });

  factory TravelModel.fromJson(Map<String, dynamic> json){
    var dayDetailListJson = json["dayList"] as List;
    return TravelModel(
      uid: json["uid"],
      tripName: json["tripName"],
      designer: json["designer"],
      dayList: dayDetailListJson.map((i) => DayDetail.fromJson(i)).toList()
    );
  }
}