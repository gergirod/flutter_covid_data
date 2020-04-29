import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_covid/data/models/covid_model.dart';
import 'package:flutter_bloc_covid/data/models/timeline_list_model.dart';
import 'package:meta/meta.dart';

abstract class CoronaGeneralState extends Equatable {}

class CoronaGeneralInitialState extends CoronaGeneralState {
  @override
  List<Object> get props => null;

}

class CoronaGeneralLoadingState extends CoronaGeneralState{
  @override
  List<Object> get props => null;


}

class CoronaGeneralSuccessState extends CoronaGeneralState {

  final Covid covid;
  final TimeLineListModel timeLineListModel;

  CoronaGeneralSuccessState({@required this.covid, @required this.timeLineListModel});

  @override
  List<Object> get props => null;

}

class CoronaGeneralErrorState extends CoronaGeneralState {

  final String message;

  CoronaGeneralErrorState({@required this.message});

  @override
  List<Object> get props => null;

}