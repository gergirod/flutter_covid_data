import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_covid/bloc/countries_bloc/countries_bloc.dart';
import 'package:flutter_bloc_covid/bloc/countries_bloc/countries_event.dart';
import 'package:flutter_bloc_covid/bloc/countries_bloc/countries_state.dart';
import 'package:flutter_bloc_covid/data/api_service.dart';
import 'package:flutter_bloc_covid/data/models/country_model.dart';
import 'package:flutter_bloc_covid/data/models/filter_model.dart';
import 'package:flutter_bloc_covid/data/repositories/countries_repository.dart';
import 'package:flutter_bloc_covid/ui/country_detail_screen.dart';
import 'package:flutter_bloc_covid/utils/utils.dart';

class CountriesScreen extends StatelessWidget {

  final CountriesRepository countriesRepository = CountriesRepository(
      apiService: ApiService.instance);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CountriesBloc(countriesRepository: countriesRepository),
      child: CountriesListScreen(),
    );
  }
}


class CountriesListScreen extends StatelessWidget {

  void _populateBottomSheet(BuildContext context) {
    List<FilterModel> filterItems = FilterModel.createFilterModelList();
    showModalBottomSheet(
        isScrollControlled: false,
        elevation: 4,
        context: context,
        builder: (BuildContext bc) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0)
                )
            ),
            height: 350.0,
            child: Padding(
              padding: const EdgeInsets.only(top: 7.0),
              child: ListView.builder(
                itemCount: filterItems.length,
                itemBuilder: (BuildContext buildContext, int index) {
                  return ListTile(
                    title: Text(filterItems[index].title),
                    onTap: () {
                      Navigator.of(context).pop();
                      BlocProvider.of<CountriesBloc>(context).add(
                          SortCountriesEvent(sort: filterItems[index].sort));
                    },
                  );
                },
              ),
            ),
          );
        });
  }

  bool isSearching = true;
  List<CountryModel> list = [];
  TextEditingController searchController = TextEditingController();

  Widget _buildCardView(CountryModel countryModel) {
    return Center(
      child: Card(
          elevation: 3,
          margin: EdgeInsets.all(15.0),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(
                          countryModel.countryInfoModel.flag
                      ),
                    ),
                    Text(countryModel.country,
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold
                      ),)
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text("Total Cases : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(Utils.formatNumber(countryModel.cases))
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text("Active Cases : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),),
                            Text(Utils.formatNumber(countryModel.active)),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text('Total Deaths : ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(Utils.formatNumber(countryModel.deaths)),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text('Recoveries : ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(Utils.formatNumber(countryModel.recovered)),
                          ],
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text('Today Cases : ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),),
                            Text(Utils.formatNumber(countryModel.todayCases))
                          ],
                        ),

                        Row(
                          children: <Widget>[
                            Text('Today Deaths : ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),),
                            Text(Utils.formatNumber(countryModel.todayDeaths))
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],

            ),
          )
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    return BlocBuilder<CountriesBloc, CountriesSate>(
      builder: (context, state) {
        if (state is CountriesLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(
                  Color(0xFF92b8d8)),
            ),
          );
        } else if (state is CountriesSuccessState) {
          List<CountryModel> countries = state.countries;
          return Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: _buildCardView(countries[index]),
                    onTap: () {
                      Navigator.push(context, CupertinoPageRoute(
                          builder: (context) =>
                              CountryDetail(countryModel: countries[index])
                      ));
                    },
                  );
                },
                itemCount: countries.length),
          );
        } else if (state is CountriesInitialState) {
          return Center(
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(
                    Color(0xFF7799bd)),
              )
          );
        } else {
          return Center(
              child: Text("No countries found",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),)
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CountriesBloc>(context).add(GetCountriesEvent());
    return Scaffold(
      backgroundColor: Color(0xFF92b8d8),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xFF92b8d8),
          title:
          TextField(
            controller: searchController,
            autofocus: false,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.white),
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                )
            ),

            onChanged: (value) {
              BlocProvider.of<CountriesBloc>(context).add(
                  FilterCountriesEvent(searchText: value));
            },
          ),
          centerTitle: true,
          actions: <Widget>[
            isSearching ?
            IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                searchController.text = '';
                BlocProvider.of<CountriesBloc>(context).add(
                    RemoveFilterEvent());
              },
            ) :
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                isSearching = true;
              },
            ),
            IconButton(
              onPressed: () {
                _populateBottomSheet(context);
              },
              icon: Icon(
                Icons.sort,
                color: Colors.white,),
            )

          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(60.0))
            ),
            child: Stack(
              children: <Widget>[_buildList(context)
              ],
            ),
          ),
        )
    );
  }

}