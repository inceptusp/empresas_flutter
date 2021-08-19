import 'package:empresas/features/list_enterprises/domain/entities/enterprise.dart';
import 'package:empresas/shared/presentation/widgets/eliptical_progress_indicator.dart';
import 'package:flutter/material.dart';

class EnterpriseDetailsPage extends StatelessWidget {
  final Enterprise enterprise;

  const EnterpriseDetailsPage({Key? key, required this.enterprise}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(enterprise.name),
      ),
      body: ListView(
        children: <Widget>[
          Image.network(
            '${enterprise.photo}',
            loadingBuilder: (context, child, progress) {
              if (progress == null) {
                return child;
              }
              return const SizedBox(
                height: 200,
                child: Center(
                  child: ElipticalProgressIndicator(),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              enterprise.description,
              style: Theme.of(context).textTheme.headline5!.copyWith(),
            ),
          )
        ],
      ),
    );
  }
}
