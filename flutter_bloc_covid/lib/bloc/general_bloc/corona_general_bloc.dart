import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_covid/bloc/general_bloc/corona_general_state.dart';
import 'package:flutter_bloc_covid/data/models/covid_model.dart';
import 'package:flutter_bloc_covid/data/models/timeline_list_model.dart';
import 'package:flutter_bloc_covid/data/repositories/general_repository.dart';

import 'corona_general_event.dart';

class CoronaGeneralBloc extends Bloc<CoronaGeneralEvent, CoronaGeneralState> {

  GeneralRepository generalRepository;

  CoronaGeneralBloc(GeneralRepository generalRepository) {
    this.generalRepository = generalRepository;
  }

  @override
  CoronaGeneralState get initialState => CoronaGeneralInitialState();

  @override
  Stream<CoronaGeneralState> mapEventToState(CoronaGeneralEvent event) async* {
    if(event is CoronaGeneralEvent) {
      yield* mapCoronaGeneralEventToState(event);
    }
  }

  Stream<CoronaGeneralState> mapCoronaGeneralEventToState(GetCoronaGeneralEvent event) async* {
    yield CoronaGeneralLoadingState();
    try {
        Covid result = await generalRepository.getGeneralData();
        TimeLineListModel timeLineListModel = await generalRepository.getGeneralHistoricData();
        yield CoronaGeneralSuccessState(covid: result, timeLineListModel: timeLineListModel);
    }catch(e) {
        yield CoronaGeneralErrorState(message: e.toString());
    }
  }

}