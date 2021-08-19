import 'dart:math';

import 'package:empresas/features/list_enterprises/domain/entities/enterprise.dart';
import 'package:flutter/material.dart';

class EnterpriseCard extends StatelessWidget {
  final Enterprise enterprise;
  final Function()? onTap;

  const EnterpriseCard({Key? key, required this.enterprise, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _randColor = Random().nextInt(Colors.primaries.length);
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('${enterprise.photo}'),
              fit: BoxFit.fill,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: Colors.primaries[_randColor].withOpacity(.7),
            ),
            child: Center(
              child: Text(
                enterprise.name,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.primaries[_randColor].computeLuminance() < .5
                          ? Colors.white
                          : Colors.grey[900],
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
