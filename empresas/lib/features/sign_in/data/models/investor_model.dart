import 'package:empresas/features/list_enterprises/data/models/enterprise_model.dart';
import 'package:empresas/features/list_enterprises/domain/entities/enterprise.dart';
import 'package:empresas/features/sign_in/domain/entities/investor.dart';

class InvestorModel extends Investor {
  InvestorModel({
    required id,
    required name,
    required email,
    required city,
    required country,
    required balance,
    photo,
    required portfolioEnterprisesNumber,
    required portfolioEnterprises,
    required portfolioValue,
    required firstAccess,
    required superAngel,
  }) : super(
          id: id,
          name: name,
          email: email,
          city: city,
          country: country,
          balance: balance,
          photo: photo,
          portfolioEnterprisesNumber: portfolioEnterprisesNumber,
          portfolioEnterprises: portfolioEnterprises,
          portfolioValue: portfolioValue,
          firstAccess: firstAccess,
          superAngel: superAngel,
        );

  factory InvestorModel.fromJson(Map<String, dynamic> json) {
    final List<Enterprise> portfolioEnterprisesList = List<Enterprise>.empty(growable: true);

    json['portfolio']['enterprises'].forEach((el) {
      portfolioEnterprisesList.add(EnterpriseModel.fromJson(el));
    });

    return InvestorModel(
      id: json['id'],
      name: json['investor_name'],
      email: json['email'],
      city: json['city'],
      country: json['country'],
      balance: json['balance'],
      photo: json['photo'],
      portfolioEnterprisesNumber: json['portfolio']['enterprises_number'],
      portfolioEnterprises: portfolioEnterprisesList,
      portfolioValue: json['portfolio_value'],
      firstAccess: json['first_access'],
      superAngel: json['super_angel'],
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> portfolioEnterprisesList =
        List<Map<String, dynamic>>.empty(growable: true);

    portfolioEnterprises.forEach((el) {
      portfolioEnterprisesList.add((el as EnterpriseModel).toJson());
    });

    return <String, dynamic>{
      'id': id,
      'investor_name': name,
      'email': email,
      'city': city,
      'country': country,
      'balance': balance,
      'photo': photo,
      'portfolio': <String, dynamic>{
        'enterprises_number': portfolioEnterprisesNumber,
        'enterprises': portfolioEnterprisesList,
      },
    };
  }
}
