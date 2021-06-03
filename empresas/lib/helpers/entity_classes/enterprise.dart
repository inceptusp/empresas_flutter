class Enterprise {
  late int id;
  String? email;
  String? facebook;
  String? twitter;
  String? linkedin;
  String? phone;
  late bool ownEnterprise;
  late String name;
  String? photo;
  late String description;
  String? city;
  String? country;
  late int value;
  late double sharePrice;
  late int enterpriseTypeId;
  late String enterpriseTypeName;

  Enterprise({
    required this.id,
    required this.name,
    required this.description,
    required this.ownEnterprise,
    required this.value,
    required this.sharePrice,
    required this.enterpriseTypeId,
    required this.enterpriseTypeName,
    this.email,
    this.facebook,
    this.twitter,
    this.linkedin,
    this.phone,
    this.photo,
    this.city,
    this.country,
  });

  // ignore: prefer_expression_function_bodies, for better readability of this method
  factory Enterprise.fromJson(Map<String, dynamic> json) {
    return Enterprise(
      id: json['id'],
      name: json['enterprise_name'],
      description: json['description'],
      ownEnterprise: json['own_enterprise'],
      value: json['value'],
      sharePrice: json['share_price'],
      enterpriseTypeId: json['enterprise_type']['id'],
      enterpriseTypeName: json['enterprise_type']['enterprise_type_name'],
      email: json['email_enterprise'],
      facebook: json['facebook'],
      twitter: json['twitter'],
      linkedin: json['linkedin'],
      phone: json['phone'],
      photo: json['photo'],
      city: json['city'],
      country: json['country'],
    );
  }
}
