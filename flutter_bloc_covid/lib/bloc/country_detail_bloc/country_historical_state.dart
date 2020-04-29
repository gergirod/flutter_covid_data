import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_covid/data/models/country_historic_model.dart';

abstract class CountryHistoricalState extends Equatable {}

class LoadingState extends CountryHistoricalState {
  @override
  List<Object> get props => null;

}

class HistoricalSuccessState extends CountryHistoricalState {
  final CountryHistoric historic;

  HistoricalSuccessState({this.historic});

  @override
  List<Object> get props => null;

}

class ErrorState extends CountryHistoricalState {

  final String errorMessage;

  ErrorState({this.errorMessage});

  @override
  List<Object> get props => null;

}