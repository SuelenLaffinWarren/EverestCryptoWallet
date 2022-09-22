// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:everest_card2_listagem/shared/models/crypto_model.dart';
import 'package:everest_card2_listagem/shared/provider/crypto_provider.dart';

class GraphicDetailsScreen extends StatefulHookConsumerWidget {
  const GraphicDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<GraphicDetailsScreen> createState() =>
      _GraphicDetailsScreenState();
}

class _GraphicDetailsScreenState extends ConsumerState<GraphicDetailsScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    final CryptoModel cryptoModel =
        ref.watch(cryptoModelProvider.notifier).state;
    final int days = ref.watch(buttonDaysProvider.state).state;

    List<FlSpot> FlSpotValues() {
      List<FlSpot> listDays = [];
      if (days != 1) {
        for (int day = 0; day < days; day++) {
          listDays.add(
            FlSpot(
              day.toDouble(),
              cryptoModel.cryptoValuesY[day].toDouble(),
            ),
          );
        }
        return listDays;
      } else {
        for (int day = 0; day < cryptoModel.cryptoValuesY.length; day++) {
          listDays.add(
            FlSpot(day.toDouble(), cryptoModel.cryptoValuesY[day].toDouble()),
          );
        }
        return listDays;
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 2,
        child: LineChart(
          LineChartData(
            minX: days.toDouble() - 1,
            maxX: 0,
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
                dotData: FlDotData(show: false),
                spots: FlSpotValues(),
                isCurved: false,
                color: Colors.pink,
                barWidth: 3.5,
                belowBarData: BarAreaData(
                  show: false,
                ),
              )
            ],
            betweenBarsData: [],
            extraLinesData: ExtraLinesData(),
            lineTouchData: LineTouchData(
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
