import 'dart:math';

import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

// class VariationPoint {
//   final double x;
//   final double y;
//   VariationPoint({
//     required this.x,
//     required this.y,
//   });
// }

// List<VariationPoint> get variationPoints {
//   final data = <double>[0, 0.5, 0.75, 1.25, 1.5, 1.75, 2];
//   return data
//       .mapIndexed(
//           ((index, element) => VariationPoint(x: index.toDouble(), y: element)))
//       .toList();
// }

List<FlSpot> spotsGraphic = [];

List<FlSpot> listVariation() {
  if (spotsGraphic.isEmpty) {
    final List<double> y = [];

    var random = Random();
    for (var i = 0; i < 90; i++) {
      y.add(double.parse((random.nextDouble()).toStringAsFixed(2)));
    }
    spotsGraphic =
        y.mapIndexed((index, y) => FlSpot(index.toDouble(), y)).toList();
  }
  return spotsGraphic;
}
