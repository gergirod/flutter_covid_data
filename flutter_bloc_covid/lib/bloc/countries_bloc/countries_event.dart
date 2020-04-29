import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_covid/utils/enum_sort.dart';

abstract class CountriesEvent extends Equatable {}

class GetCountriesEvent extends CountriesEvent {
  @override
  List<Object> get props => [];
}

class SortCountriesEvent extends CountriesEvent {

  final Sort sort;

  SortCountriesEvent({this.sort});

  @override
  List<Object> get props => [sort];

}

class FilterCountriesEvent extends CountriesEvent {

  final String searchText;

  FilterCountriesEvent({this.searchText});

  @override
  List<Object> get props => null;
}

class RemoveFilterEvent extends CountriesEvent {
  @override
  List<Object> get props => null;
}