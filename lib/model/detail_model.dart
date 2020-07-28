class DetailModel {
  final String nameOfScence;
  final String longitude;
  final String latitude;
  final String des;
  final String picURL;
  final bool pointOrNot;
  final String contructor;
  final num category;
  final bool done;

  DetailModel({
    this.nameOfScence, 
    this.longitude, 
    this.latitude, 
    this.des,
    this.picURL,
    this.pointOrNot,
    this.contructor,
    this.category,
    this.done,
  });

  factory DetailModel.fromJson(Map<String, dynamic> json) {
    return DetailModel(
      nameOfScence: json["nameOfScence"],
      longitude: json["longitude"],
      latitude: json["latitude"],
      des: json["des"],
      picURL: json["picURL"],
      pointOrNot: json["pointOrNot"],
      contructor: json["contructor"],
      category: json["category"],
      done: json["done"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "nameOfScence": this.nameOfScence,
      "longitude": this.longitude,
      "latitude": this.latitude,
      "des": this.des,
      "picURL": this.picURL,
      "pointOrNot": this.pointOrNot,
      "contructor": this.contructor,
      "category": this.category,
      "done": this.done,
    };
  }
}