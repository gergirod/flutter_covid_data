
import 'package:flutter_bloc_covid/data/api_service.dart';
import 'package:flutter_bloc_covid/data/models/country_model.dart';

class CountriesRepository {
  final ApiService apiService;
  CountriesRepository({
    this.apiService});

  Future<List<CountryModel>> getCountries() async {
    List<CountryModel> countries = await apiService.getCountries();
    return countries;
  }

  List<CountryModel> getFilterList(String text, List<CountryModel> countries) {
    List<CountryModel> filteredList = countries.where((country) =>
        country.country.toLowerCase().toString().contains(text.toLowerCase())).toList();

    return  filteredList;
  }

}