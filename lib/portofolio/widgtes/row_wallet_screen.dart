import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../provider/providers.dart';

class RowCryptoScreen extends StatefulHookConsumerWidget {
  var value;
  String quantityCrypto;
  String imageCrypto;
  String nameCrypto;
  String abrevNameCrypto;

  RowCryptoScreen({
    Key? key,
    required this.value,
    required this.quantityCrypto,
    required this.imageCrypto,
    required this.nameCrypto,
    required this.abrevNameCrypto,
  }) : super(key: key);

  @override
  ConsumerState<RowCryptoScreen> createState() => _RowCryptoScreenState();
}

class _RowCryptoScreenState extends ConsumerState<RowCryptoScreen> {
  @override
  Widget build(
    BuildContext context,
  ) {
    @override
    final isVisible = ref.watch(visibilityProvider.state);

    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(48),
                child: Image.asset(
                  widget.imageCrypto,
                  width: 48,
                  height: 48,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textAlign: TextAlign.start,
                    widget.abrevNameCrypto,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 19,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.nameCrypto,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Color.fromRGBO(117, 118, 128, 1),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            width: 8,
          ),
          Row(
            children: [
              isVisible.state
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          NumberFormat.simpleCurrency(
                                  locale: 'pt-BR', decimalDigits: 2)
                              .format(
                            DecimalIntl(widget.value),
                          ),
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 19,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${widget.quantityCrypto} ${widget.abrevNameCrypto}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(117, 118, 128, 1),
                          ),
                        ),
                      ],
                    )
                  : SizedBox(
                      child: Container(
                        width: 100,
                        height: 28,
                        color: Colors.grey.shade200,
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.only(bottom: 23),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color.fromRGBO(117, 118, 128, 1),
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
