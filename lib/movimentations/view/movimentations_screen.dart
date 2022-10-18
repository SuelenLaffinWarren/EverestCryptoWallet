import 'package:everest_card2_listagem/movimentations/model/movimentations_model.dart';
import 'package:everest_card2_listagem/movimentations/provider/movimentations_provider.dart';
import 'package:everest_card2_listagem/portfolio/provider/isVisible_provider.dart';
import 'package:everest_card2_listagem/shared/template/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../shared/bottom_navigation/bottom_navigation_page.dart';

import '../widgets/list_tile_movimentations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MovimentationsScreen extends StatefulHookConsumerWidget {
  static const route = '/movimentations';
  const MovimentationsScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<MovimentationsScreen> createState() =>
      _MovimentationsScreenState();
}

class _MovimentationsScreenState extends ConsumerState<MovimentationsScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    List<MovimentationsModel> list = [];
    final isVisible = ref.watch(stateVisible.state);
    final movimentationList = ref.watch(movimentationListProvider);

    return Scaffold(
      appBar:
          AppBarTemplate(title: AppLocalizations.of(context)!.movimentations),
      body: SafeArea(
        child: Visibility(
          visible: ref.watch(movimentationListProvider).isNotEmpty,
          replacement: Scaffold(
            body: Center(
              child: Column(
                children: [
                  Lottie.asset('assets/lottie/not_found.json',
                      width: 150, height: 150),
                  Text(
                    AppLocalizations.of(context)!.noMovimentations,
                    style: const TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: ref.watch(movimentationListProvider).length,
            itemBuilder: (context, index) {
              list.add(ref.watch(movimentationListProvider.state).state[index]);

              return ListTileMovimentation(
                isVisible: isVisible,
                movimentation: movimentationList[index],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationWallet(
        selectedIndex: 1,
      ),
    );
  }
}
