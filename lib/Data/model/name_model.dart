class Namee {
  final String? firstname;
  final String? lastname;

  Namee({this.firstname, this.lastname});

  Namee.fromJson(Map<String, dynamic> json)
      : firstname = json['firstname'],
        lastname = json['lastname'];

  Map<String, dynamic> toJson() =>
      {'firstname': firstname, 'lastname': lastname};
}
