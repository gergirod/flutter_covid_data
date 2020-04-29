import 'package:flutter_bloc_covid/data/api_service.dart';
import 'package:flutter_bloc_covid/data/models/country_historic_model.dart';

class CountryHistoricalRepository {

  ApiService apiService;

  CountryHistoricalRepository({
    this.apiService
  });

  Future<CountryHistoric> getCountryHistorical(String country) async {
    return await apiService.getCountryHistoric(country);
  }

}