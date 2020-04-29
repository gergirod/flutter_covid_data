import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_covid/bloc/country_detail_bloc/country_historical_bloc.dart';
import 'package:flutter_bloc_covid/bloc/country_detail_bloc/country_historical_event.dart';
import 'package:flutter_bloc_covid/bloc/country_detail_bloc/country_historical_state.dart';
import 'package:flutter_bloc_covid/data/api_service.dart';
import 'package:flutter_bloc_covid/data/models/country_historic_model.dart';
import 'package:flutter_bloc_covid/data/models/country_model.dart';
import 'package:flutter_bloc_covid/data/repositories/country_historical_repository.dart';
import 'package:flutter_bloc_covid/ui/widgets/app_widgets.dart';
import 'package:flutter_bloc_covid/ui/widgets/country_detail_widgets.dart';

class CountryDetail extends StatelessWidget {

  final CountryModel countryModel;
  final CountryHistoricalRepository countryHistoricalRepository =
  new CountryHistoricalRepository(apiService: ApiService.instance);
  CountryDetail({this.countryModel});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountryHistoricalBloc(countryHistoricalRepository: countryHistoricalRepository),
      child: CountryDetailScreen(countryModel: countryModel),
    );
  }
}

class CountryDetailScreen extends StatelessWidget {
  final CountryModel countryModel;

  CountryDetailScreen({this.countryModel});

  Widget buildSuccessUi(CountryHistoric countryHistoric) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0 , left: 10.0, right: 10.0, bottom: 20.0),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(countryModel.getDate(),
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
                   buildCountryDataCard(countryModel),
                   buildCountryDataCardExtra(countryModel)
                 ],
              ),

              Column(
                children: <Widget>[
                  buildCountryTodayDataCard(countryModel),
                  buildCountryPerMillionDataCard(countryModel)
                ],
              )
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          buildCountryPieChart(countryModel),
          SizedBox(
            height: 10.0,
          ),
          buildLineChart(countryHistoric.timeLineListModel)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CountryHistoricalBloc>(context).add(
        GetCountryHistorical(country: countryModel.country));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF92b8d8),
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          countryModel.country,
          style: TextStyle(
              fontSize: 21.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.5
        ),
        ),
      ),
      backgroundColor: Color(0xFF92b8d8),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(60.0))
          ),
          child: BlocBuilder<CountryHistoricalBloc, CountryHistoricalState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          Color(0xFF7799bd)),
                    ),
                  );
                } else if (state is HistoricalSuccessState) {
                  return buildSuccessUi(state.historic);
                } else {
                  return Text('');
                }
              }),

        ),
      ),

    );
  }


}