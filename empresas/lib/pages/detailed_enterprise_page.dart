import 'package:empresas/helpers/enterprises_api.dart';
import 'package:empresas/helpers/entities/enterprise.dart';
import 'package:empresas/widgets/eliptical_progress_indicator.dart';
import 'package:flutter/material.dart';

class DetailedEnterprisePage extends StatelessWidget {
  final Enterprise enterprise;

  const DetailedEnterprisePage({Key? key, required this.enterprise}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(enterprise.name),
      ),
      body: ListView(
        children: <Widget>[
          Image.network(
            '${EnterprisesApi.server}${enterprise.photo}',
            loadingBuilder: (context, child, progress) {
              if (progress == null) {
                return child;
              }
              return SizedBox(
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
