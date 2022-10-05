import '../provider/conversion_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/model/crypto_view_data.dart';

class RowConvertButtons extends StatefulHookConsumerWidget {
  RowConvertButtons({
    Key? key,
    required this.symbol,
    required this.image,
    required this.listCrypto,
    required this.selectCrypto,
  }) : super(key: key);

  String selectCrypto;
  final String symbol;
  final String image;
  List<CryptoViewData> listCrypto;

  @override
  ConsumerState<RowConvertButtons> createState() => _RowConvertButtonsState();
}

class _RowConvertButtonsState extends ConsumerState<RowConvertButtons> {
  @override
  Widget build(BuildContext) {
    List<DropdownMenuItem> getDropList(List<CryptoViewData> listCrypto) {
      List<DropdownMenuItem> dropCryptoList = listCrypto
          .map((crypto) => DropdownMenuItem(
                value: crypto.symbol.toUpperCase(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.network(
                      crypto.image,
                      height: 27,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(crypto.symbol.toUpperCase())
                  ],
                ),
              ))
          .toList();
      return dropCryptoList;
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 30),
                child: SizedBox(
                    width: 120,
                    height: 55,
                    child: DropdownButtonFormField(
                      onChanged: (value) {},
                      value: widget.symbol,
                      isExpanded: true,
                      decoration: InputDecoration(
                          labelText: 'Crypto',
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(227, 228, 235, 1)),
                              borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(227, 228, 235, 1)),
                              borderRadius: BorderRadius.circular(30))),
                      items: [
                        DropdownMenuItem(
                          value: widget.symbol,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.network(
                                widget.image,
                                height: 24,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(widget.symbol.toUpperCase()),
                            ],
                          ),
                        ),
                      ],
                    )),
              )),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.arrow_right_arrow_left,
              color: Color.fromRGBO(224, 43, 87, 1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 30),
              child: SizedBox(
                width: 120,
                height: 55,
                child: DropdownButtonFormField(
                  value: widget.selectCrypto,
                  isExpanded: true,
                  decoration: InputDecoration(
                      labelText: 'Crypto',
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(227, 228, 235, 1)),
                          borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(227, 228, 235, 1)),
                          borderRadius: BorderRadius.circular(30))),
                  items: getDropList(widget.listCrypto),
                  onChanged: (op) {
                    setState(() {
                      widget.selectCrypto = op;
                      ref.read(conversionProvider.notifier).state =
                          widget.listCrypto.firstWhere(
                              (crypto) => crypto.symbol.toUpperCase() == op!);
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
