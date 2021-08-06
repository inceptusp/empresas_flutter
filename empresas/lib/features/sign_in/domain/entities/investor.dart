import 'package:empresas/features/list_enterprises/domain/entities/enterprise.dart';
import 'package:equatable/equatable.dart';

class Investor extends Equatable {
  final int id;
  final String name;
  final String email;
  final String city;
  final String country;
  final double balance;
  final String? photo;
  final int portfolioEnterprisesNumber;
  final List<Enterprise> portfolioEnterprises;
  final double portfolioValue;
  final bool firstAccess;
  final bool superAngel;

  Investor({
    required this.id,
    required this.name,
    required this.email,
    required this.city,
    required this.country,
    required this.balance,
    this.photo,
    required this.portfolioEnterprisesNumber,
    required this.portfolioEnterprises,
    required this.portfolioValue,
    required this.firstAccess,
    required this.superAngel,
  });

  @override
  List<Object?> get props {
    return <Object?>[
      id,
      name,
      email,
      city,
      country,
      balance,
      photo,
      portfolioEnterprisesNumber,
      portfolioEnterprises,
      portfolioValue,
      firstAccess,
      superAngel,
    ];
  }
}
