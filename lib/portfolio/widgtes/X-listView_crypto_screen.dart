// import 'package:decimal/decimal.dart';
// import 'package:everest_card2_listagem/dataSource/crypto_datasource.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../provider/providers.dart';
// import 'row_crypto_screen.dart';

// class RowListWallet extends StatefulHookConsumerWidget {
//   const RowListWallet({super.key});

//   // const RowListWallet({
//   //   Key? key,
//   //   required this.isVisibleState,
//   //   required this.totalCrypto,
//   //   required this.btcValue,
//   //   required this.quantityBtc,
//   //   required this.abrvBtc,
//   //   required this.ethValue,
//   //   required this.quantityEth,
//   //   required this.abrvEth,
//   //   required this.ltcValue,
//   //   required this.quantityLtc,
//   //   required this.abrvLtc,
//   // }) : super(key: key);

//   // final StateController<bool> isVisibleState;
//   // final Decimal totalCrypto;
//   // final Decimal btcValue;
//   // final double quantityBtc;
//   // final String abrvBtc;
//   // final Decimal ethValue;
//   // final double quantityEth;
//   // final String abrvEth;
//   // final Decimal ltcValue;
//   // final double quantityLtc;
//   // final String abrvLtc;

//   @override
//   ConsumerState<RowListWallet> createState() => _RowListWalletState();
// }

// class _RowListWalletState extends ConsumerState<RowListWallet> {
//   final getAllCrypto = CryptoDatasource();

//   @override
//   Widget build(BuildContext context) {
//     var isVisibleState = ref.watch(visibilityProvider.state);
//     final cryptoList = getAllCrypto.getAllCrypto();

    

//     return Expanded(
//       child: ListView.builder(
//         physics: const BouncingScrollPhysics(),
//         itemCount: cryptoList.length,
//         itemBuilder: (context, index) {
//           return RowCryptoScreen(
//             cryptoModel: cryptoList[index],
//           );
//         },
//       ),
//     );
//   }
// }
