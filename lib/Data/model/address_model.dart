import 'geolocation_model.dart';

class Addresss {
  final Geolocationn? geolocation;
  final String? city;
  final String? street;
  final int? number;
  final String? zipcode;

  Addresss({
    this.geolocation,
    this.city,
    this.street,
    this.number,
    this.zipcode,
  });

  Addresss.fromJson(Map<String, dynamic> json)
      : geolocation = (json['geolocation'] as Map<String, dynamic>?) != null
            ? Geolocationn.fromJson(json['geolocation'] as Map<String, dynamic>)
            : null,
        city = json['city'] as String?,
        street = json['street'] as String?,
        number = json['number'] as int?,
        zipcode = json['zipcode'] as String?;

  Map<String, dynamic> toJson() => {
        'geolocation': geolocation?.toJson(),
        'city': city,
        'street': street,
        'number': number,
        'zipcode': zipcode
      };
}
