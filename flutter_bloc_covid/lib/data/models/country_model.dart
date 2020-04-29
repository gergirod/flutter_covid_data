import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_covid/data/models/country_info_model.dart';
import 'package:flutter_bloc_covid/utils/utils.dart';


class CountryModel extends Equatable{
  int updated;
  String country;
  CountryInfoModel countryInfoModel;
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
  int testPerOneMillion;

  CountryModel({
    this.updated,
    this.country,
    this.countryInfoModel,
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
    this.testPerOneMillion
  });

  static List<CountryModel> convertToListFromResult(List<dynamic> list) {
    List<CountryModel> countries = List();
    for(var object in list) {
      countries.add(CountryModel.fromJson(object));
    }
    return countries;
  }

  String getPercentage(int value) {
    double percentage = Utils.getPercentage(value, cases);
    String stringPercentage = percentage.toStringAsFixed(2);
    return '%$stringPercentage';
  }

  String getPercentageOfDeaths() {
    double percentage = Utils.getPercentage(deaths, cases);
    String stringPercentage = percentage.toStringAsFixed(2);
    return ' (%$stringPercentage of total cases)';
  }

  String getPercentageOfRecoveries() {
    double percentage = Utils.getPercentage(recovered, cases);
    String stringPercentage = percentage.toStringAsFixed(2);
    return ' (%$stringPercentage of total cases)';
  }

  String getDate() {
    return Utils.millisecondsToDate(updated).toUpperCase();
  }

  factory CountryModel.fromJson(Map<String, dynamic> map) {
    return CountryModel(
      updated: map['updated'],
      country: map['country'],
      countryInfoModel: CountryInfoModel.fromMap(map['countryInfo']),
      cases: map['cases'],
      todayCases: map['todayCases'],
      todayDeaths: map['todayDeaths'],
      recovered: map['recovered'],
      active: map['active'],
      critical: map['critical'],
      casesPerOneMillion: map['casesPerOneMillion'],
      deathsPerOneMillion: map['deathsPerOneMillion'],
      tests: map['tests'],
      testPerOneMillion: map['testsPerOneMillion'],
      deaths: map['deaths']
    );
  }

  @override
  List<Object> get props => [updated, country, countryInfoModel, cases, todayCases, deaths, todayDeaths, recovered, active, critical, casesPerOneMillion, deathsPerOneMillion, tests, testPerOneMillion];

}