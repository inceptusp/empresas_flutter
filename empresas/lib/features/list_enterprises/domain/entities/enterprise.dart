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
}
