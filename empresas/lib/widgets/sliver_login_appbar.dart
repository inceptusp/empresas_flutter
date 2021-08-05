import 'package:empresas/widgets/croped_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

class SliverLoginAppBar extends StatelessWidget {
  const SliverLoginAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      centerTitle: true,
      elevation: 0,
      toolbarHeight: 128,
      expandedHeight: 257,
      title: const CropedLogo(),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.elliptical(2000, 400),
        ),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(2000, 400),
          ),
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: <Color>[
              Color(0xAACC99C0),
              Color(0xAAAF2674),
              Color(0xAAB40F94),
              Color(0xAA861FBA),
            ],
          ),
        ),
        child: FlexibleSpaceBar(
          background: Center(
            child: Text(
              EnterprisesLocalizations.of(context)!.welcomeTitle,
              style: Theme.of(context).textTheme.headline5!.apply(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
