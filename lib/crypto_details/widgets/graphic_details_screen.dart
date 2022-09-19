// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brasil_fields/brasil_fields.dart';
import 'package:everest_card2_listagem/shared/provider/crypto_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GraphicDetailsScreen extends StatefulHookConsumerWidget {
  const GraphicDetailsScreen({
    Key? key,
    required this.points,
    required this.days,
  }) : super(key: key);
  final List<FlSpot> points;
  final double days;

  @override
  ConsumerState<GraphicDetailsScreen> createState() =>
      _GraphicDetailsScreenState();
}

class _GraphicDetailsScreenState extends ConsumerState<GraphicDetailsScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    void changeCryptoValue(double newValue) async {
      ref.watch(currentPriceCryptoProvider.state).state = newValue;
      initState();
    }

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: LineChart(
              LineChartData(
                titlesData: FlTitlesData(
                  show: false,
                ),
                borderData: FlBorderData(
                  show: false,
                  border: Border.all(color: Colors.white),
                ),
                gridData: FlGridData(
                  show: false,
                  drawVerticalLine: false,
                ),
                maxX: -0.2,
                maxY: 103612.60,
                minY: 0,
                minX: widget.days - 1,
                baselineX: 3,
                clipData: FlClipData.all(),
                lineBarsData: [
                  LineChartBarData(
                    isStrokeCapRound: true,
                    spots: widget.points,
                    isCurved: false,
                    color: Colors.pink,
                    barWidth: 3.5,
                    belowBarData: BarAreaData(
                      show: false,
                      gradient: LinearGradient(
                        colors: [Colors.pink, Colors.purple]
                            .map((e) => e.withOpacity(0.3))
                            .toList(),
                      ),
                    ),
                  )
                ],
                betweenBarsData: [],
                extraLinesData: ExtraLinesData(),
                lineTouchData: LineTouchData(
                  touchCallback: (FlTouchEvent event, lineTouchResponse) {
                    setState(() {});
                  },
                  touchTooltipData: LineTouchTooltipData(
                    fitInsideHorizontally: true,
                    tooltipBgColor: Colors.grey,
                    tooltipPadding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 5,
                    ),
                    getTooltipItems: (touchedSpots) {
                      return touchedSpots.map(
                        (touchedSpots) {
                          changeCryptoValue(touchedSpots.y);
                          return LineTooltipItem(
                            UtilBrasilFields.obterReal(touchedSpots.y),
                            const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ).toList();
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
