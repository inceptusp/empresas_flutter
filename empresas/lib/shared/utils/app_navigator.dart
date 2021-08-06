import 'package:empresas/features/list_enterprises/domain/entities/enterprise.dart';
import 'package:flutter/widgets.dart';

abstract class AppNavigator {
  void goToEnterpriseDetails(BuildContext context, Enterprise enterprise);

  void pop(BuildContext context);

  void replaceWithLogin(BuildContext context);

  void replaceWithHome(BuildContext context);
}
