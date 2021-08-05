import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

class SliverHomeAppBar extends StatelessWidget {
  final Function(String)? onSearch;

  const SliverHomeAppBar({Key? key, this.onSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      centerTitle: true,
      expandedHeight: 188,
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 28),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                labelText: EnterprisesLocalizations.of(context)!.searchBoxLabel,
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              onSubmitted: onSearch,
            ),
          ),
        ),
      ),
      flexibleSpace: Container(
        height: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: <Color>[
              Color(0xAAAF2674),
              Color(0xAAB40F94),
              Color(0xAA861FBA),
            ],
          ),
        ),
        child: Image.asset('assets/images/ioasys_logos.png', fit: BoxFit.cover),
      ),
    );
  }
}
