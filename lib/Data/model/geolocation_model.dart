class Geolocation {
  final String? lat;
  final String? long;

  Geolocation({
    this.lat,
    this.long,
  });

  factory Geolocation.fromJson(Map<String, dynamic> json) {
    return Geolocation(lat: json['lat'], long: json['long']);
  }

/* autre method de deserialization "convert json format to object"
  Geolocation.fromJson(Map<String, dynamic> json)
    : lat = json['lat'] as String?,
      long = json['long'] as String?;
*/

  Map<String, dynamic> toJson() => {'lat': lat, 'long': long};
}
