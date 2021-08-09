import 'package:empresas/features/list_enterprises/domain/entities/enterprise.dart';

class EnterpriseModel extends Enterprise {
  EnterpriseModel({
    required id,
    email,
    facebook,
    twitter,
    linkedin,
    phone,
    required ownEnterprise,
    required name,
    photo,
    required description,
    city,
    country,
    required value,
    required sharePrice,
    required enterpriseTypeId,
    required enterpriseTypeName,
  }) : super(
          id: id,
          email: email,
          facebook: facebook,
          twitter: twitter,
          linkedin: linkedin,
          phone: phone,
          ownEnterprise: ownEnterprise,
          name: name,
          photo: photo,
          description: description,
          city: city,
          country: country,
          value: value,
          sharePrice: sharePrice,
          enterpriseTypeId: enterpriseTypeId,
          enterpriseTypeName: enterpriseTypeName,
        );

  factory EnterpriseModel.fromJson(Map<String, dynamic> json) {
    return EnterpriseModel(
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
