// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:decimal/decimal.dart';
import 'package:everest_card2_listagem/shared/api/model/crypto_view_data.dart';
import 'package:everest_card2_listagem/shared/api/model/market_graphic_view_data.dart';
import 'package:everest_card2_listagem/portfolio/provider/crypto_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GraphicDetailsScreen extends StatefulHookConsumerWidget {
  GraphicDetailsScreen(
      {Key? key, required this.listmarketData, required this.crypto})
      : super(key: key);
  MarketGraphicViewData listmarketData;
  CryptoViewData crypto;

  @override
  ConsumerState<GraphicDetailsScreen> createState() =>
      _GraphicDetailsScreenState();
}

class _GraphicDetailsScreenState extends ConsumerState<GraphicDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    List<FlSpot> listSpots = [];

    List<FlSpot> getSpotsList() {
      for (int i = 0; i < widget.listmarketData.values.length; i++) {
        listSpots.add(
          FlSpot(
            i.toDouble(),
            widget.listmarketData.values[i].toDouble(),
          ),
        );
      }

      return listSpots;
    }

    @override
    void initState() {
      getSpotsList();
      super.initState();
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 2,
        child: LineChart(
          LineChartData(
            titlesData: FlTitlesData(
              show: false,
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: Colors.white),
            ),
            gridData: FlGridData(
              show: false,
              drawVerticalLine: false,
            ),
            clipData: FlClipData.all(),
            lineBarsData: [
              LineChartBarData(
                spots: getSpotsList(),
                dotData: FlDotData(show: false),
                isCurved: false,
                color: Colors.pink,
                barWidth: 2.5,
                belowBarData: BarAreaData(
                  show: false,
                ),
              )
            ],
            betweenBarsData: [],
            extraLinesData: ExtraLinesData(),
            lineTouchData: LineTouchData(
              touchCallback:
                  (FlTouchEvent event, LineTouchResponse? lineTouch) {
                if (!event.isInterestedForInteractions ||
                    lineTouch == null ||
                    lineTouch.lineBarSpots == null) {
                  ref.read(currentPriceGraphicProvider.state).state =
                      Decimal.parse('${widget.crypto.current_price}');
                } else {
                  ref.read(currentPriceGraphicProvider.state).state =
                      Decimal.parse(
                    lineTouch.lineBarSpots![0].y.toString(),
                  );
                }
              },
              getTouchedSpotIndicator:
                  (LineChartBarData barData, List<int> spotIndexes) {
                return spotIndexes.map((index) {
                  return TouchedSpotIndicatorData(
                    FlLine(
                      color: const Color.fromRGBO(224, 43, 87, 1),
                      strokeWidth: 2,
                    ),
                    FlDotData(show: false),
                  );
                }).toList();
              },
              touchTooltipData: LineTouchTooltipData(
                tooltipBgColor: const Color.fromRGBO(224, 43, 87, 1),
                tooltipRoundedRadius: 20,
                getTooltipItems: (touchedSpots) {
                  return touchedSpots.map(
                    (touchedSpot) {
                      return LineTooltipItem(
                        FormatValueNumber.formatDouble(touchedSpot.y),
                        const TextStyle(color: Colors.white, fontSize: 15),
                      );
                    },
                  ).toList();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
