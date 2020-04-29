import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_covid/bloc/general_bloc/corona_general_bloc.dart';
import 'package:flutter_bloc_covid/bloc/general_bloc/corona_general_event.dart';
import 'package:flutter_bloc_covid/bloc/general_bloc/corona_general_state.dart';
import 'package:flutter_bloc_covid/data/api_service.dart';
import 'package:flutter_bloc_covid/data/repositories/general_repository.dart';
import 'package:flutter_bloc_covid/ui/widgets/app_widgets.dart';
import 'package:flutter/services.dart';




class HomeScreen extends StatelessWidget {
  final GeneralRepository generalRepository = GeneralRepository(
      ApiService.instance);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF7799bd), //or set color with: Color(0xFF0000FF)
    ));

    return BlocProvider(
      create: (context) => CoronaGeneralBloc(generalRepository),
      child: GeneralCountriesScreen(),
    );
  }
}

class GeneralCountriesScreen extends StatelessWidget {

  Widget buildSuccessUi(CoronaGeneralSuccessState coronaGeneralSuccessState) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(coronaGeneralSuccessState.covid.getDate(),
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  buildGeneralDataCard(coronaGeneralSuccessState.covid),
                  buildGeneralDataCardTotalCountries(coronaGeneralSuccessState.covid)
                ],
              ),
              Column(
                children: <Widget>[
                  buildGeneralDataCardToday(coronaGeneralSuccessState.covid),
                  buildGeneralDataCardExtra(coronaGeneralSuccessState.covid)
                ],
              )
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          buildSimplePieChart(coronaGeneralSuccessState.covid),
          buildLineChart(coronaGeneralSuccessState.timeLineListModel)
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CoronaGeneralBloc>(context).add(GetCoronaGeneralEvent());
    return Scaffold(
      backgroundColor: Color(0xFF92b8d8),
      appBar: AppBar(
        backgroundColor: Color(0xFF92b8d8),
        elevation: 0.0,
        centerTitle: true,
        title: Text('GLOBAL DATA',
        style: TextStyle(
          fontSize: 21.0,
          fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.5
        ),),
      ),
      body : Container(
          height: MediaQuery.of(context).size.height,
          child:  SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60.0))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: BlocBuilder<CoronaGeneralBloc, CoronaGeneralState>(
                      builder: (context, state) {
                        if (state is CoronaGeneralLoadingState) {
                          return buildLoadingUi(context);
                        } else if (state is CoronaGeneralErrorState) {
                          return buildErrorUi(state.message);
                        } else if (state is CoronaGeneralInitialState) {
                          return buildLoadingUi(context);
                        } else {
                          return buildSuccessUi(state);
                        }
                      }
                  ),
                ),
              ),
            ),
          ),
        ),
      );
  }

}