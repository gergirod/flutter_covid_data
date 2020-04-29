import 'package:flutter_bloc_covid/data/models/time_data_model.dart';

class TimeLineListModel {

  List<TimeDataModel> cases;
  List<TimeDataModel> deaths;
  List<TimeDataModel> recovered;

  TimeLineListModel({
    this.cases,
    this.deaths,
    this.recovered
  });

  List<String> getDateList() {

    List<String> newList = List();
    deaths.forEach((deaths) {
      newList.add(deaths.date);
    });

    return newList;

  }

  List<int> getDeathsAmountsList() {

    List<int> newList = List();
    deaths.forEach((deaths) {
      newList.add(deaths.amount);
    });

    return newList;

  }

  List<int> getCasesAmountsList() {

    List<int> newList = List();
    cases.forEach((deaths) {
      newList.add(deaths.amount);
    });

    return newList;

  }

  List<int> getRecoveredAmountsList() {

    List<int> newList = List();
    recovered.forEach((deaths) {
      newList.add(deaths.amount);
    });

    return newList;

  }

  factory TimeLineListModel.fromMap(Map<String, dynamic> map) {

    var listCases = List<TimeDataModel>();
    map['cases'].forEach((k, v) {
      TimeDataModel timeDataModel = new TimeDataModel(date: k, amount: v);
      listCases.add(timeDataModel);

    });

    var listDeaths = List<TimeDataModel>();
    map['deaths'].forEach((k, v)  {
      TimeDataModel timeDataModel = new TimeDataModel(date: k, amount: v);
      listDeaths.add(timeDataModel);
    });

    var listRecovered = List<TimeDataModel>();
    map['recovered'].forEach((k, v) {
      TimeDataModel timeDataModel = new TimeDataModel(date: k, amount: v);
      listRecovered.add(timeDataModel);
    });


    return TimeLineListModel(
      cases: listCases,
      deaths: listDeaths,
      recovered: listRecovered
    );
  }

}