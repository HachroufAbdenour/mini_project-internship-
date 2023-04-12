class Name {
  final String? firstname;
  final String? lastname;

  Name({
    required this.firstname,
    required this.lastname,
  });

  Name.fromJson(Map<String, dynamic> json)
      : firstname = json['firstname'],
        lastname = json['lastname'];

  Map<String, dynamic> toJson() =>
      {'firstname': firstname, 'lastname': lastname};
}
