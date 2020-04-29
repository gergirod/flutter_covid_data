import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_covid/bloc/countries_bloc/countries_event.dart';
import 'package:flutter_bloc_covid/bloc/countries_bloc/countries_state.dart';
import 'package:flutter_bloc_covid/data/models/country_model.dart';
import 'package:flutter_bloc_covid/data/repositories/countries_repository.dart';
import 'package:flutter_bloc_covid/utils/enum_sort.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesSate> {

  final CountriesRepository countriesRepository;
  List<CountryModel> countryList;

  @override
  get initialState => CountriesInitialState();

  CountriesBloc({
    this.countriesRepository
  });

  @override
  Stream<CountriesSate> mapEventToState(CountriesEvent event) async* {
    if (event is GetCountriesEvent) {
      yield* mapCountriesEventToState(event);
    } else if (event is FilterCountriesEvent) {
      yield*mapFilterEventToState(event);
    } else if (event is RemoveFilterEvent) {
      yield CountriesSuccessState(countries: countryList);
    } else if (event is SortCountriesEvent) {
      yield* mapSortEventToState(event);
    }
  }

  Stream<CountriesSate> mapCountriesEventToState(
      GetCountriesEvent countriesEvent) async* {
    yield CountriesLoadingState();
    try {
      countryList = await countriesRepository.getCountries();
      yield CountriesSuccessState(countries: countryList);
    } catch (e) {
      print(e.toString());
      yield CountriesErrorState(errorMessage: e.toString());
    }
  }

  Stream<CountriesSate> mapFilterEventToState(
      FilterCountriesEvent filterCountriesEvent) async* {
    if (filterCountriesEvent.searchText.isNotEmpty) {
      yield CountriesLoadingState();
      List<CountryModel> countries = countriesRepository.getFilterList(
          filterCountriesEvent.searchText, countryList);
      if (countries.length > 0) {
        yield CountriesSuccessState(countries: countries);
      } else {
        yield CountriesErrorState(errorMessage: "No countries Found");
      }
    } else {
      yield CountriesErrorState(errorMessage: "This cant be empty");
    }
  }

  Stream<CountriesSate> mapSortEventToState(
      SortCountriesEvent sortCountriesEvent) async* {
    switch(sortCountriesEvent.sort) {
      case Sort.AZ :
        countryList.sort((a, b) => a.country.compareTo(b.country));
      break;
      case Sort.ZA :
        countryList.sort((a, b) => b.country.compareTo(a.country));
        break;
      case Sort.ACTIVE_CASES_HIGH:
        countryList.sort((a, b) => b.active.compareTo(a.active));
        break;
      case Sort.ACTIVE_CASES_LOW:
        countryList.sort((a, b) => a.active.compareTo(b.active));
        break;
      case Sort.TOTAL_DEATHS_HIGH:
        countryList.sort((a, b) => b.deaths.compareTo(a.deaths));
        break;
      case Sort.TOTAL_DEATHS_LOW:
        countryList.sort((a, b) => a.deaths.compareTo(b.deaths));
        break;
      case Sort.TOTAL_CASES_HIGH:
        countryList.sort((a, b) => b.cases.compareTo(a.cases));
        break;
      case Sort.TOTAL_CASES_LOW:
        countryList.sort((a, b) => a.cases.compareTo(b.cases));
        break;
      case Sort.TOTAL_RECOVERIES_HIGH:
        countryList.sort((a, b) => b.recovered.compareTo(a.recovered));
        break;
      case Sort.TOTAL_RECOVERIES_LOW:
        countryList.sort((a, b) => a.recovered.compareTo(b.recovered));
        break;
      case Sort.TODAY_DEATHS_HIGH:
        countryList.sort((a, b) => b.deaths.compareTo(a.deaths));
        break;
      case Sort.TODAY_CASES_LOW:
        countryList.sort((a, b) => a.deaths.compareTo(b.deaths));
        break;
      case Sort.TOTAL_TESTS_HIGH:
        countryList.sort((a, b) => b.tests.compareTo(a.tests));
        break;
      case Sort.TOTAL_TEST_LOW:
        countryList.sort((a, b) => a.tests.compareTo(b.tests));
        break;
      case Sort.DEATHS_PER_ONE_MILLION_LOW:
        countryList.sort((a, b) => a.deathsPerOneMillion.compareTo(b.deathsPerOneMillion));
        break;
      case Sort.DEATHS_PER_ONE_MILLION_HIGH:
        countryList.sort((a, b) => b.deathsPerOneMillion.compareTo(a.deathsPerOneMillion));
        break;
      case Sort.CASES_PER_ONE_MILLION_HIGH:
        countryList.sort((a, b) => b.casesPerOneMillion.compareTo(a.casesPerOneMillion));
        break;
      case Sort.CASES_PER_ONE_MILLION_LOW:
        countryList.sort((a, b) => a.casesPerOneMillion.compareTo(b.casesPerOneMillion));
        break;
      case Sort.TESTS_PER_MILLION_HIGH:
        countryList.sort((a, b) => b.testPerOneMillion.compareTo(a.testPerOneMillion));
        break;
      case Sort.TEST_PER_MILLION_LOW:
        countryList.sort((a, b) => a.testPerOneMillion.compareTo(b.testPerOneMillion));
        break;
      case Sort.TODAY_DEATHS_LOW:
        countryList.sort((a, b) => a.todayDeaths.compareTo(b.todayDeaths));
        break;
      case Sort.TODAY_CASES_HIGH:
        countryList.sort((a, b) => b.todayDeaths.compareTo(a.todayDeaths));
        break;
    }

    yield CountriesSuccessState(countries: countryList);

  }
}