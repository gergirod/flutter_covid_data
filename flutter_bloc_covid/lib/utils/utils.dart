import 'package:intl/intl.dart';

class Utils {

  static String millisecondsToDate(int timestamp) {

    var date = DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000 );
    String formatted = DateFormat('EEEE, dd MMM').format(date );
    return formatted;

  }

  static double getPercentage(int cases, int totalCases) {
    return (cases*100)/totalCases;
  }

  static String formatNumber(int number) {
    var f = new NumberFormat("###,###", "en_US");
    return f.format(number);

  }

}