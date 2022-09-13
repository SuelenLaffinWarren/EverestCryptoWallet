import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  bool isVisible = true;

  static double btcValue = 6557.00;
  static double ethValue = 7996.00;
  static double ltcValue = 245.00;

  double totalCrypto = btcValue + ethValue + ltcValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Cripto',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(224, 43, 87, 1),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 17),
                        child: IconButton(
                          icon: Icon(isVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () => setState(
                            (() => isVisible = !isVisible),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    replacement: SizedBox(
                      child: Container(
                        width: 195,
                        height: 40,
                        color: Colors.grey.shade200,
                      ),
                    ),
                    visible: isVisible,
                    child: Text(
                      UtilBrasilFields.obterReal(totalCrypto),
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const Text(
                    'Valor total de moedas',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(117, 118, 128, 1),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              thickness: 1,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.only(top: 16, bottom: 16, right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(48),
                      child: Image.asset(
                        'assets/images/bitcoin.png',
                        width: 48,
                        height: 48,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        textAlign: TextAlign.start,
                        'BTC',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 19,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Bitcoin',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Color.fromRGBO(117, 118, 128, 1),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 118, top: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Visibility(
                          replacement: SizedBox(
                            child: Container(
                              width: 100,
                              height: 28,
                              color: Colors.transparent,
                            ),
                          ),
                          visible: isVisible,
                          child: Text(
                            UtilBrasilFields.obterReal(btcValue),
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 19,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        if (isVisible)
                          const Text(
                            '0.65 BTC',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(117, 118, 128, 1),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 22, left: 0),
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
            ),
            const Divider(
              thickness: 1,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        top: 16, bottom: 16, right: 13, left: 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(48),
                      child: Image.asset(
                        'assets/images/ETH.png',
                        width: 48,
                        height: 48,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        textAlign: TextAlign.start,
                        'ETH',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 19,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Ethereum',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Color.fromRGBO(117, 118, 128, 1)),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 95, top: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Visibility(
                          replacement: SizedBox(
                            child: Container(
                              width: 100,
                              height: 28,
                              color: Colors.transparent,
                            ),
                          ),
                          visible: isVisible,
                          child: Text(
                            UtilBrasilFields.obterReal(ethValue),
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 19,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        if (isVisible)
                          const Text(
                            '0.94 ETH',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(117, 118, 128, 1),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 22, left: 0),
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
            ),
            const Divider(
              thickness: 1,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        top: 16, bottom: 16, right: 12, left: 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(48),
                      child: Image.asset(
                        'assets/images/LTC.png',
                        width: 48,
                        height: 48,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        textAlign: TextAlign.start,
                        'LTC',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 19,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Litecoin',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Color.fromRGBO(117, 118, 128, 1),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 118, top: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Visibility(
                          replacement: SizedBox(
                            child: Container(
                              width: 85,
                              height: 28,
                              color: Colors.transparent,
                            ),
                          ),
                          visible: isVisible,
                          child: Text(
                            UtilBrasilFields.obterReal(ltcValue),
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 19,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        if (isVisible)
                          const Text(
                            '0.82 LTC',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(117, 118, 128, 1)),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 22, left: 0),
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
            ),
            const Divider(
              thickness: 1,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/warrenTrue.png'),
          label: 'Portifólio',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/crypto_false.png'),
          label: 'Movimentações',
        ),
      ], selectedItemColor: Colors.black),
    );
  }
}
