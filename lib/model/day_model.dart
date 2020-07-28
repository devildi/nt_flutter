import 'package:nt_flutter/model/detail_model.dart';

class DayDetail {

  final List<DetailModel> dayList;

  DayDetail({
    this.dayList
  });
  
  factory DayDetail.fromJson(Map<String, dynamic> json){
    var dayListJson = json["dayList"] as List;
    return DayDetail(
      dayList: dayListJson.map((i) => DetailModel.fromJson(i)).toList()
    );
  }
}