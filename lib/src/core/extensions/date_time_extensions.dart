import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String formattedDate() {
    return DateFormat('dd/MM/yyyy').format(this);
  }
}
