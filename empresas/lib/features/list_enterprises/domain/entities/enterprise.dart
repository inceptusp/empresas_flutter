import 'package:equatable/equatable.dart';

class Enterprise extends Equatable {
  final int id;
  final String? email;
  final String? facebook;
  final String? twitter;
  final String? linkedin;
  final String? phone;
  final bool ownEnterprise;
  final String name;
  final String? photo;
  final String description;
  final String? city;
  final String? country;
  final int value;
  final double sharePrice;
  final int enterpriseTypeId;
  final String enterpriseTypeName;

  Enterprise({
    required this.id,
    this.email,
    this.facebook,
    this.twitter,
    this.linkedin,
    this.phone,
    required this.ownEnterprise,
    required this.name,
    this.photo,
    required this.description,
    this.city,
    this.country,
    required this.value,
    required this.sharePrice,
    required this.enterpriseTypeId,
    required this.enterpriseTypeName,
  });

  @override
  List<Object?> get props {
    return <Object?>[
      id,
      email,
      facebook,
      twitter,
      linkedin,
      phone,
      ownEnterprise,
      name,
      photo,
      description,
      city,
      country,
      value,
      sharePrice,
      enterpriseTypeId,
      enterpriseTypeName,
    ];
  }

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
