import 'package:intl/intl.dart';

final numberFormater = NumberFormat.currency(
  locale: "pt_BR",
  decimalDigits: 2,
  name: "R\$",
);

final doubleFormat = NumberFormat("##0.00", "en_US");
