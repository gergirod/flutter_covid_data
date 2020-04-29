import 'package:flutter_bloc_covid/data/api_service.dart';
import 'package:flutter_bloc_covid/data/models/covid_model.dart';
import 'package:flutter_bloc_covid/data/models/timeline_list_model.dart';

class GeneralRepository {

  ApiService apiService;

  GeneralRepository(ApiService apiService) {
    this.apiService = apiService;
  }

  Future<Covid> getGeneralData() async {
    return await apiService.getCovidGeneralData();
  }

  Future<TimeLineListModel> getGeneralHistoricData() async {
    return await apiService.getGeneralHistoricData();
  }

}