// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:decimal/intl.dart';
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

  // var value;
  // String quantityCrypto;
  // String imageCrypto;
  // String nameCrypto;
  // String abrevNameCrypto;
  // Function() onTapDetails;

  // RowCryptoScreen({
  //   Key? key,
  //   required this.value,
  //   required this.quantityCrypto,
  //   required this.imageCrypto,
  //   required this.nameCrypto,
  //   required this.abrevNameCrypto,
  //   required this.onTapDetails,
  // }) : super(key: key);

  @override
  ConsumerState<RowCryptoScreen> createState() => _RowCryptoScreenState();
}

class _RowCryptoScreenState extends ConsumerState<RowCryptoScreen> {
  @override
  Widget build(BuildContext context) {
    @override
    final isVisible = ref.watch(stateVisible.state);
    // colocar aqui todos os providers que eu criei, depois passa-los no ontap,
    //colocar eles também ná página de detalhes da crypto

    return ListTile(
      onTap: widget.cryptoModel.onTapDetails,
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
                      DecimalIntl(widget.cryptoModel.totalCrypto),
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
