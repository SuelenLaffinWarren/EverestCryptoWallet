import 'package:everest_card2_listagem/conversion/provider/conversion_provider.dart';
import 'package:everest_card2_listagem/portfolio/provider/crypto_provider.dart';
import 'package:everest_card2_listagem/shared/template/app_bar.dart';
import 'package:everest_card2_listagem/shared/utils/arguments.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/body_revision.dart';

class RevisionScreen extends StatefulHookConsumerWidget {
  RevisionScreen({Key? key, required this.args}) : super(key: key);
  static const route = '/revision';
  Arguments args;
  @override
  ConsumerState<RevisionScreen> createState() => _RevisionScreenState();
}

class _RevisionScreenState extends ConsumerState<RevisionScreen> {
  @override
  Widget build(BuildContext context) {
    final cryptoData = ref.watch(cryptoListProvider);
    final secondCrypto = ref.watch(secondSelectedCryptoProvider.state);
    final controller = ref.watch(textFieldControllerProvider.state);
    final totalEstimated = ref.watch(totalEstimatedProvider.state);

    return cryptoData.when(
      data: (data) {
        return Scaffold(
          appBar: AppBarTemplate(
            title: AppLocalizations.of(context)!.review,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: BodyRevision(
                controller: controller,
                totalEstimated: totalEstimated,
                secondCrypto: secondCrypto,
                args: widget.args,
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) => const Center(
        child: Text('Error'),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
