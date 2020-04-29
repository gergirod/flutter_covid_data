import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_covid/bloc/country_detail_bloc/country_historical_event.dart';
import 'package:flutter_bloc_covid/bloc/country_detail_bloc/country_historical_state.dart';
import 'package:flutter_bloc_covid/data/models/country_historic_model.dart';
import 'package:flutter_bloc_covid/data/repositories/country_historical_repository.dart';

class CountryHistoricalBloc extends Bloc<CountryHistoricalEvent, CountryHistoricalState> {

  CountryHistoricalRepository countryHistoricalRepository;

  CountryHistoricalBloc({this.countryHistoricalRepository});

  @override
  CountryHistoricalState get initialState => LoadingState();

  @override
  Stream<CountryHistoricalState> mapEventToState(CountryHistoricalEvent event) async* {
    if(event is GetCountryHistorical) {
      yield* mapCountriesEventToState(event);
    }
  }

  Stream<CountryHistoricalState> mapCountriesEventToState(GetCountryHistorical countryHistorical) async* {
    yield LoadingState() ;
    try{
      CountryHistoric countryHistoric = await countryHistoricalRepository.getCountryHistorical(countryHistorical.country);
      yield HistoricalSuccessState(historic: countryHistoric);
    }catch(e) {
      print(e.toString());
      yield ErrorState(errorMessage: e.toString());
    }
  }



}