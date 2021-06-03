import 'dart:io';

import 'package:empresas/helpers/enterprises_api.dart';
import 'package:empresas/helpers/entity_classes/enterprise.dart';
import 'package:empresas/pages/detailed_enterprise_page.dart';
import 'package:empresas/widgets/eliptical_progress_indicator.dart';
import 'package:empresas/widgets/enterprise_card.dart';
import 'package:empresas/widgets/error_messages.dart';
import 'package:empresas/widgets/sliver_home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

// ignore_for_file: prefer_expression_function_bodies, for better readability on Widgets files
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Enterprise>? _enterprises;
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverHomeAppBar(onSearch: _searchEnterprises),
          if (_isSearching)
            const SliverFillRemaining(
              child: Center(
                child: ElipticalProgressIndicator(),
              ),
            ),
          if (_enterprises != null && _enterprises!.isEmpty)
            SliverFillRemaining(
              child: Center(
                child: Text(EnterprisesLocalizations.of(context)!.resultsFoundLabel(0)),
              ),
            ),
          if (_enterprises == null) const SliverFillRemaining(),
          if (_enterprises != null && _enterprises!.isNotEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  EnterprisesLocalizations.of(context)!.resultsFoundLabel(_enterprises!.length),
                ),
              ),
            ),
          if (_enterprises != null && _enterprises!.isNotEmpty)
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) {
                  return EnterpriseCard(
                    enterprise: _enterprises![i],
                    onTap: () => _openDetailedEnterprisesPage(_enterprises![i]),
                  );
                },
                childCount: _enterprises!.length,
              ),
            ),
        ],
      ),
    );
  }

  void _showErrorAlert([String error = '']) {
    showDialog(
      context: context,
      builder: (context) => ErrorMessage.errorAlert(
        context: context,
        errorCode: error,
        onClose: () => Navigator.pop(context),
      ),
    );
  }

  void _openDetailedEnterprisesPage(Enterprise enterprise) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailedEnterprisePage(enterprise: enterprise),
        settings: const RouteSettings(name: '/DetailedEnterprisePage'),
      ),
    );
  }

  void _searchEnterprises(String query) async {
    setState(() {
      _isSearching = true;
    });
    try {
      _enterprises = await EnterprisesApi.search(query);
    } on SocketException catch (_) {
      _showErrorAlert('connection_error');
    } catch (e) {
      _showErrorAlert('$e');
    }
    setState(() {
      _isSearching = false;
    });
  }
}
