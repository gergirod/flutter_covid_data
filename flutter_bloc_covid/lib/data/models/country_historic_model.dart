import 'package:flutter_bloc_covid/data/models/timeline_list_model.dart';

class CountryHistoric {

  String country;
  TimeLineListModel timeLineListModel;

  CountryHistoric({
    this.country,
    this.timeLineListModel
  });

  factory CountryHistoric.fromMap(Map<dynamic, dynamic> map) {

    return CountryHistoric(
      country: map['country'],
      timeLineListModel: TimeLineListModel.fromMap(map['timeline']));
  }

}