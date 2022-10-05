import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import '../../crypto_details/view/crypto_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../shared/utils/arguments.dart';
import '../model/crypto_view_data.dart';

class CryptoListTile extends HookConsumerWidget {
  const CryptoListTile({
    Key? key,
    required this.crypto,
    required this.isVisible,
    required this.userCryptoValue,
  }) : super(key: key);

  final CryptoViewData crypto;
  final Decimal userCryptoValue;

  final StateController<bool> isVisible;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(DetailsCryptoScreen.route,
            arguments: Arguments(
              cryptoData: crypto,
              userCryptoValue: userCryptoValue,
            ));
      },
      horizontalTitleGap: 0,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(48),
        child: Image.network(
          crypto.image,
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
              crypto.symbol.toUpperCase(),
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
                      DecimalIntl(
                        Decimal.parse(
                          crypto.userValueMoney(userCryptoValue).toString(),
                        ),
                      ),
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
              crypto.name,
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
                    '$userCryptoValue ${crypto.symbol.toUpperCase()}',
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
