import 'dart:convert';
import 'dart:math';
import 'package:flutter_bloc_covid/data/models/country_historic_model.dart';
import 'package:flutter_bloc_covid/data/models/country_model.dart';
import 'package:flutter_bloc_covid/data/models/covid_model.dart';
import 'package:flutter_bloc_covid/data/models/timeline_list_model.dart';
import 'package:http/http.dart' as http;
class ApiService {

  ApiService._instantiate();

  static const String BASE_URL = "http://corona.lmao.ninja";

  static final instance = ApiService._instantiate();

  Future<Covid> getCovidGeneralData() async {
    var response = await http.get(BASE_URL+'/v2/all');
    if(response.statusCode == 200) {
      return Covid.fromMap(json.decode(response.body));
    }else {
      throw Exception('there was an error ');
    }
  }

  Future<List<CountryModel>> getCountries() async {
    var response = await http.get(BASE_URL+"/v2/countries");
    if(response.statusCode == 200) {
      return CountryModel.convertToListFromResult(jsonDecode(response.body));
    }else {
      throw Exception('there was a error');
    }
  }

  Future<CountryHistoric> getCountryHistoric(String country) async {

    Map<String ,String> queryParams = {
      'lastdays': '40'
    };
    var uri = Uri.http('corona.lmao.ninja', '/v2/historical/'+country, queryParams);
    var response = await http.get(uri);
    if(response.statusCode == 200) {
      return CountryHistoric.fromMap(jsonDecode(response.body));
    }else {
      throw Exception('there was an error');
    }

  }

  Future<TimeLineListModel> getGeneralHistoricData() async {

    Map<String ,String> queryParams = {
      'lastdays': '40'
    };

    var uri = Uri.http('corona.lmao.ninja', '/v2/historical/all', queryParams);
    var response = await http.get(uri);
    if(response.statusCode == 200) {

      return TimeLineListModel.fromMap(jsonDecode((response.body)));
    }else {
      throw Exception('there was an error');
    }
  }

}