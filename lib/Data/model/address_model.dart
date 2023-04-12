import 'geolocation_model.dart';

class Address {
  final Geolocation? geolocation;
  final String? city;
  final String? street;
  final int? number;
  final String? zipcode;

  Address({
    this.geolocation,
    this.city,
    this.street,
    this.number,
    this.zipcode,
  });

  Address.fromJson(Map<String, dynamic> json)
      : geolocation = (json['geolocation'] as Map<String, dynamic>?) != null
            ? Geolocation.fromJson(json['geolocation'] as Map<String, dynamic>)
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
