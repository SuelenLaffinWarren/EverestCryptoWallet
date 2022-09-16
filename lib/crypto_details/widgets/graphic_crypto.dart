// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:everest_card2_listagem/shared/provider/crypto_provider.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// import 'package:everest_card2_listagem/shared/models/crypto_model.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class HistoricGraphic extends StatefulWidget {
//   CryptoModel crypto;
//   HistoricGraphic({
//     Key? key,
//     required this.crypto,
//   }) : super(key: key);

//   @override
//   State<HistoricGraphic> createState() => _HistoricGraphicState();
// }

// enum Period { hour, day, month, year, total }

// class _HistoricGraphicState extends State<HistoricGraphic> {
//   List<Color> colors = [
//     Colors.pink,
//     Colors.yellow,
//   ];

//   Period period = Period.hour;
//   List<Map<String, dynamic>> historic = [];
//   List completedData = [];
//   List<FlSpot> graphicData = [];
//   double maxX = 0;
//   double maxY = 0;
//   double minY = 0;
//   ValueNotifier<bool> loaded = ValueNotifier(false);

//   setDados() async {
//     loaded.value = false;
//     graphicData = [];

//     if (historic.isEmpty)
//       historic = await repository.getHistoricCrypto(widget.crypto);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: AspectRatio(
//           aspectRatio: 2,
//           child: Stack(
//             children: [
//               ValueListenableBuilder(
//                   valueListenable: loaded,
//                   builder: (context, bool isLoaded, _) {
//                     return (isLoaded)
//                         ? LineChart(
//                             getChartData(),
//                           )
//                         : const Center(
//                             child: CircularProgressIndicator(),
//                           );
//                   })
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
