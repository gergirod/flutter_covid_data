import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_covid/data/models/country_model.dart';
import 'package:flutter_bloc_covid/utils/utils.dart';
import 'package:charts_flutter/flutter.dart' as charts;


Widget buildCountryDataCard(CountryModel countryModel) {
  return Card(
    elevation: 3,
    color: Color(0xFF77bcbd),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 120.0,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text('Total Cases:',
                            style: TextStyle(
                                letterSpacing: 1.0,
                                color: Colors.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold
                            )
                        ),
                        Text(Utils.formatNumber(countryModel.cases).toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 7.0,
                    ),
                    Column(
                      children: <Widget>[
                        Text('Active Cases:',
                            style: TextStyle(
                                letterSpacing: 1.0,
                                color: Colors.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold
                            )
                        ),
                        Text(Utils.formatNumber(countryModel.active).toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 7.0,
                    ),
                    Column(
                      children: <Widget>[
                        Text('Total Deaths:',
                            style: TextStyle(
                                letterSpacing: 1.0,
                                color: Colors.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold
                            )),
                        Text(Utils.formatNumber(countryModel.deaths).toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                            )
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildCountryTodayDataCard(CountryModel countryModel) {
  return Card(
    elevation: 3,
    color: Color(0xFFcb779e),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 120.0,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text('Today Cases',
                            style: TextStyle(
                                letterSpacing: 1.0,
                                color: Colors.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold
                            )
                        ),
                        Text(Utils.formatNumber(countryModel.todayCases).toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 7.0,
                    ),
                    Column(
                      children: <Widget>[
                        Text('Today Deaths',
                            style: TextStyle(
                                letterSpacing: 1.0,
                                color: Colors.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold
                            )
                        ),
                        Text(Utils.formatNumber(countryModel.todayDeaths).toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildCountryDataCardExtra(CountryModel countryModel) {
  return Card(
    elevation: 3,
    color:  Color(0xFFcb7a77),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 120.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text('Recovered',
                            style: TextStyle(
                                letterSpacing: 1.0,
                                color: Colors.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold
                            )
                        ),
                        Text(Utils.formatNumber(countryModel.recovered)
                            .toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 7.0,
                    ),
                    Column(
                      children: <Widget>[
                        Text('Total Tests',
                            style: TextStyle(
                                letterSpacing: 1.0,
                                color: Colors.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold
                            )
                        ),
                        Text(Utils.formatNumber(countryModel.tests).toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildCountryPerMillionDataCard(CountryModel countryModel) {
  return Card(
    elevation: 3,
    color: Color(0xFFcba477),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 120.0,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Center(
                child: Column(
                  children: <Widget>[

                    Text('Data P/Million',
                        style: TextStyle(
                            letterSpacing: 1.0,
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    SizedBox(
                      height: 10.0,
                    ),

                    Column(
                      children: <Widget>[
                        Text('Cases ',
                            style: TextStyle(
                                letterSpacing: 1.0,
                                color: Colors.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold
                            )
                        ),
                        Text(Utils.formatNumber(countryModel.casesPerOneMillion).toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Column(
                      children: <Widget>[
                        Text('Deaths',
                            style: TextStyle(
                                letterSpacing: 1.0,
                                color: Colors.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold
                            )
                        ),
                        Text(Utils.formatNumber(countryModel.deathsPerOneMillion).toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Column(
                      children: <Widget>[
                        Text('Tests',
                            style: TextStyle(
                                letterSpacing: 1.0,
                                color: Colors.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold
                            )),
                        Text(Utils.formatNumber(countryModel.testPerOneMillion).toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                            )
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildCountryPieChart(CountryModel countryModel) {
  List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0,'deaths', countryModel.deaths, countryModel.getPercentage(countryModel.deaths), new charts.Color(r: 203, g: 122, b: 119)),
      new LinearSales(1,'recover', countryModel.recovered, countryModel.getPercentage(countryModel.recovered), new charts.Color(r: 119, g: 188, b: 189)),
      new LinearSales(2,'active', countryModel.active, countryModel.getPercentage(countryModel.active), new charts.Color(r: 137, g: 210, b: 176)),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
        colorFn: (LinearSales sales, _) => sales.color,
// Set a label accessor to control the text of the arc label.
        labelAccessorFn: (LinearSales row, _) => '${row.percentage}',
      )
    ];
  }

  return Card(
      elevation: 3,
      child: Container(
          width: 400.0,
          child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 10,
                            width: 10,
                            color: Color(0xFF89d2b0),
                          ),
                          Text('Active Cases',
                            style: TextStyle(
                                fontSize: 12.0
                            ),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 10,
                            width: 10,
                            color: Color(0xFF77bcbd),
                          ),
                          Text('Recovered',
                            style: TextStyle(
                                fontSize: 12.0
                            ),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 10,
                            width: 10,
                            color: Color(0xFFcb7a77),
                          ),
                          Text('Deaths',
                            style: TextStyle(
                                fontSize: 12.0
                            ),)
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 250,
                  width: 250,
                  child: charts.PieChart(_createSampleData(), animate: true,
                      defaultRenderer: new charts.ArcRendererConfig(
                          arcWidth: 70,
                          arcRendererDecorators: [
                            new charts.ArcLabelDecorator()
                          ])),
                )
              ])
      )
  );
}

class LinearSales {
  final int year;
  final String label;
  final int sales;
  final String percentage;
  final charts.Color color;

  LinearSales(this.year, this.label, this.sales, this.percentage, this.color);
}