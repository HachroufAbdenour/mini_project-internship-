class Geolocationn {
  final String? lat;
  final String? long;

  Geolocationn({
    this.lat,
    this.long,
  });

  factory Geolocationn.fromJson(Map<String, dynamic> json) {
    return Geolocationn(lat: json['lat'], long: json['long']);
  }

/* autre method de deserialization "convert json format to object"
  Geolocation.fromJson(Map<String, dynamic> json)
    : lat = json['lat'] as String?,
      long = json['long'] as String?;
*/

  Map<String, dynamic> toJson() => {'lat': lat, 'long': long};
}
