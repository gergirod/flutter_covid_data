
import 'package:flutter_bloc_covid/utils/utils.dart';

class Covid {
  int updated;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int active;
  int critical;
  int casesPerOneMillion;
  int deathsPerOneMillion;
  int tests;
  double testPerOneMillion;
  int affectedCountries;

  Covid({
    this.updated,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.tests,
    this.testPerOneMillion,
    this.affectedCountries
  });

  String getDate() {
    return Utils.millisecondsToDate(updated).toUpperCase();
  }

  String getPercentage(int value) {
    double percentage = Utils.getPercentage(value, cases);
    String stringPercentage = percentage.toStringAsFixed(2);
    return '%$stringPercentage';
  }

  String getPercentageOfDeaths() {
    double percentage = Utils.getPercentage(deaths, cases);
    String stringPercentage = percentage.toStringAsFixed(2);
    return ' (%$stringPercentage/total cases)';
  }

  String getPercentageOfRecoveries() {
    double percentage = Utils.getPercentage(recovered, cases);
    String stringPercentage = percentage.toStringAsFixed(2);
    return ' (%$stringPercentage/total cases)';
  }

  factory Covid.fromMap(Map<String, dynamic> map) {
    return Covid(
      updated: map['updated'],
      cases: map['cases'],
      todayCases: map['todayCases'],
      deaths: map['deaths'],
      todayDeaths: map['todayDeaths'],
      recovered: map['recovered'],
      active: map['active'],
      critical: map['critical'],
      casesPerOneMillion: map['casesPerOneMillion'],
      deathsPerOneMillion: map['deatsPerOneMillion'],
      tests: map['tests'],
      testPerOneMillion: map['testPerOneMillion'],
      affectedCountries: map['affectedCountries']
    );
  }
}