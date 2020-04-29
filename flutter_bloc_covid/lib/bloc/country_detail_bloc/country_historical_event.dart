import 'package:equatable/equatable.dart';

abstract class CountryHistoricalEvent extends Equatable {}

class GetCountryHistorical extends CountryHistoricalEvent {

  final String country;
  GetCountryHistorical({this.country});

  @override
  List<Object> get props => null;

}