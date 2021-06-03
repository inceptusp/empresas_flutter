import 'package:empresas/helpers/enterprises_api.dart';
import 'package:empresas/helpers/entity_classes/enterprise.dart';
import 'package:flutter/material.dart';

// ignore_for_file: prefer_expression_function_bodies, for better readability on Widgets files
class DetailedEnterprisePage extends StatefulWidget {
  final Enterprise enterprise;

  const DetailedEnterprisePage({Key? key, required this.enterprise}) : super(key: key);

  @override
  _DetailedEnterprisePageState createState() => _DetailedEnterprisePageState();
}

class _DetailedEnterprisePageState extends State<DetailedEnterprisePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.enterprise.name),
      ),
      body: ListView(
        children: <Widget>[
          Image.network('${EnterprisesApi.server}${widget.enterprise.photo}'),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              widget.enterprise.description,
              style: Theme.of(context).textTheme.headline5!.copyWith(),
            ),
          )
        ],
      ),
    );
  }
}
