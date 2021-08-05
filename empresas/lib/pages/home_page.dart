import 'dart:io';

import 'package:empresas/helpers/utils/app_navigator.dart';
import 'package:empresas/helpers/enterprises_api.dart';
import 'package:empresas/helpers/entities/enterprise.dart';
import 'package:empresas/widgets/eliptical_progress_indicator.dart';
import 'package:empresas/widgets/enterprise_card.dart';
import 'package:empresas/widgets/error_messages.dart';
import 'package:empresas/widgets/sliver_home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Enterprise>? _enterprises;
  bool _isSearching = false;
  late AppNavigator appNavigator;

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
                    onTap: () => appNavigator.goToEnterpriseDetails(context, _enterprises![i]),
                  );
                },
                childCount: _enterprises!.length,
              ),
            ),
        ],
      ),
    );
  }

  @override
  void initState() {
    appNavigator = context.read<AppNavigator>();
    super.initState();
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

  void _showErrorAlert([String error = '']) {
    showDialog(
      context: context,
      builder: (context) => ErrorMessage.errorAlert(
        context: context,
        errorCode: error,
        onClose: () => appNavigator.pop(context),
      ),
    );
  }
}
