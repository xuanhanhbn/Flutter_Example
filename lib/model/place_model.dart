class PlaceModel {
  int? id;
  String? placeName;
  String? urlImage;
  String? starRating;
  PlaceModel({this.id, this.placeName, this.urlImage, this.starRating});

  factory PlaceModel.valueFromJson(Map<String, dynamic> json) {
    return PlaceModel(
        id: json["id"] as int,
        placeName: json["placeName"] as String,
        urlImage: json["urlImage"] as String,
        starRating: json["starRating"] as String);
  }

  static List<PlaceModel> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => PlaceModel.valueFromJson(json)).toList();
  }

  // @override
  // String toString() {
  //   // TODO: implement toString
  //   return "id: $id, name: $placeName, image: $urlImage, rate:$starRating";
  // }
}
