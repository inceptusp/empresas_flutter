import 'package:empresas/shared/presentation/widgets/eliptical_progress_indicator.dart';
import 'package:empresas/shared/presentation/widgets/error_messages.dart';
import 'package:empresas/features/list_enterprises/presentation/controllers/home_controller.dart';
import 'package:empresas/features/list_enterprises/presentation/widgets/enterprise_card.dart';
import 'package:empresas/features/list_enterprises/presentation/widgets/sliver_home_appbar.dart';
import 'package:empresas/shared/presentation/utils/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController _homeController = HomeController();
  late AppNavigator _appNavigator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) => CustomScrollView(
          slivers: [
            SliverHomeAppBar(onSearch: _homeController.searchEnterprises),
            if (_homeController.isSearching)
              const SliverFillRemaining(
                child: Center(
                  child: ElipticalProgressIndicator(),
                ),
              ),
            if (_homeController.enterprises == null) const SliverFillRemaining(),
            if (_homeController.enterprises != null && _homeController.enterprises!.isEmpty)
              SliverFillRemaining(
                child: Center(
                  child: Text(EnterprisesLocalizations.of(context)!.resultsFoundLabel(0)),
                ),
              ),
            if (_homeController.enterprises != null && _homeController.enterprises!.isNotEmpty)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    EnterprisesLocalizations.of(context)!
                        .resultsFoundLabel(_homeController.enterprises!.length),
                  ),
                ),
              ),
            if (_homeController.enterprises != null && _homeController.enterprises!.isNotEmpty)
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) {
                    return EnterpriseCard(
                      enterprise: _homeController.enterprises![i],
                      onTap: () => _appNavigator.goToEnterpriseDetails(
                          context, _homeController.enterprises![i]),
                    );
                  },
                  childCount: _homeController.enterprises!.length,
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    _appNavigator = context.read<AppNavigator>();
    autorun(
      (_) {
        if (_homeController.searchError != null) {
          _showErrorAlert(_homeController.searchError!);
        }
      },
    );
    super.initState();
  }

  void _showErrorAlert([String error = '']) {
    showDialog(
      context: context,
      builder: (context) => ErrorMessage.errorAlert(
        context: context,
        errorCode: error,
        onClose: () => _appNavigator.pop(context),
      ),
    );
  }
}
