import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

const locale = 'pt-BR';

void startLocale() => initializeDateFormatting(locale);

String formatDate(DateTime date) {
  startLocale();
  return DateFormat.yMMMd(locale).format(date);
}
