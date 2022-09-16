// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:everest_card2_listagem/crypto_details/crypto_details_screen.dart';
import 'package:everest_card2_listagem/shared/provider/crypto_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../shared/models/crypto_model.dart';
import '../provider/providers.dart';

class RowCryptoScreen extends StatefulHookConsumerWidget {
  CryptoModel cryptoModel;

  RowCryptoScreen({
    super.key,
    required this.cryptoModel,
  });

  @override
  ConsumerState<RowCryptoScreen> createState() => _RowCryptoScreenState();
}

class _RowCryptoScreenState extends ConsumerState<RowCryptoScreen> {
  @override
  Widget build(BuildContext context) {
    @override
    final isVisible = ref.watch(stateVisible.state);
    CryptoModel cryptoModel = widget.cryptoModel;

    var currentPriceDecimal =
        Decimal.parse(cryptoModel.currentValueCryptoWallet.toString());

    return ListTile(
      onTap: () {
        ref.watch(abrvCryptoProvider.state).state = cryptoModel.abrvCrypto;
        ref.watch(quantityProvider.state).state = cryptoModel.quantity;
        ref.watch(imagePathProvider.state).state = cryptoModel.imagePath;
        ref.watch(nameCryptoProvider.state).state = cryptoModel.nameCrypto;
        ref.watch(currentPriceCryptoProvider.state).state =
            cryptoModel.currentPriceCrypto;
        ref.watch(variationCryptoProvider.state).state =
            cryptoModel.variationCrypto;
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => DetailsCryptoScreen()));
      },
      horizontalTitleGap: 0,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(48),
        child: Image.asset(
          widget.cryptoModel.imagePath,
          width: 48,
          height: 48,
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              textAlign: TextAlign.start,
              widget.cryptoModel.abrvCrypto,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 19,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            isVisible.state
                ? Text(
                    NumberFormat.simpleCurrency(
                            locale: 'pt-BR', decimalDigits: 2)
                        .format(
                      DecimalIntl(currentPriceDecimal),
                    ),
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 19,
                    ),
                  )
                : SizedBox(
                    child: Container(
                      width: 110,
                      height: 20,
                      color: Colors.grey.shade200,
                    ),
                  ),
          ],
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(left: 10, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.cryptoModel.nameCrypto,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Color.fromRGBO(117, 118, 128, 1),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            isVisible.state
                ? Text(
                    '${widget.cryptoModel.quantity} ${widget.cryptoModel.abrvCrypto}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(117, 118, 128, 1),
                    ),
                  )
                : SizedBox(
                    child: Container(
                      width: 90,
                      height: 17,
                      color: Colors.grey.shade200,
                    ),
                  ),
          ],
        ),
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(bottom: 35),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_forward_ios,
            color: Color.fromRGBO(117, 118, 128, 1),
            size: 18,
          ),
        ),
      ),
    );
  }
}
