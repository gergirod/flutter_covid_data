import 'package:flutter_bloc_covid/data/models/country_model.dart';
import 'package:meta/meta.dart';


abstract class CountriesSate  {}

class CountriesLoadingState extends CountriesSate {

}

class CountriesInitialState extends CountriesSate {


}

class CountriesSuccessState extends CountriesSate {

  List<CountryModel> countries;

  CountriesSuccessState({@required this.countries});

}

class CountriesErrorState extends CountriesSate {
  final String errorMessage;
  CountriesErrorState({@required this.errorMessage});

}
