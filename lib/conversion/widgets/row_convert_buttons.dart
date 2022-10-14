import 'package:everest_card2_listagem/portfolio/provider/crypto_provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/model/crypto_view_data.dart';

class RowConvertButtons extends StatefulHookConsumerWidget {
  RowConvertButtons({
    Key? key,
    required this.symbol,
    required this.image,
    required this.cryptoViewData,
    required this.onChange,
  }) : super(key: key);

  final String symbol;
  final String image;
  CryptoViewData cryptoViewData;
  final void Function(CryptoViewData?) onChange;

  @override
  ConsumerState<RowConvertButtons> createState() => _RowConvertButtonsState();
}

class _RowConvertButtonsState extends ConsumerState<RowConvertButtons> {
  @override
  Widget build(BuildContext) {
    final cryptoList = ref.watch(cryptoListProvider);
    List<CryptoViewData> listCrypto = [];

    for (CryptoViewData crypto in cryptoList.value!.cryptoListViewData) {
      listCrypto.add(crypto);
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 20, top: 20),
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
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
          ),
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
                    value: widget.cryptoViewData,
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
                    items: listCrypto.map<DropdownMenuItem<CryptoViewData>>(
                        (CryptoViewData crypto) {
                      return DropdownMenuItem(
                          value: crypto,
                          child: Row(
                            children: [
                              Image.network(
                                crypto.image,
                                scale: 13,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(crypto.symbol.toUpperCase())
                            ],
                          ));
                    }).toList(),
                    onChanged: widget.onChange),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
