import 'package:intl/intl.dart';

extension FormatterExtension on double {
  String get currencyPTBR {
    final currentFormat = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: r'R$',
    );
    return currentFormat.format(this);
  }
}
