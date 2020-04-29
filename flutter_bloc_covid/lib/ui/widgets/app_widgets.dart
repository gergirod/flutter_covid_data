
import 'dart:convert';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_covid/data/models/covid_model.dart';
import 'package:flutter_bloc_covid/data/models/timeline_list_model.dart';
import 'package:flutter_bloc_covid/utils/utils.dart';
import 'package:flutter_echarts/flutter_echarts.dart';

Widget buildLoadingUi(BuildContext context) {
  return Center(
      child: Container(
        child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFF7799bd)),
        ),
      ));
}

Widget buildErrorUi(String message) {
  return Center(
    child: Text(
      message,
      style: TextStyle(color: Colors.red),
    ),
  );
}

Widget buildGeneralDataCard(Covid covid) {
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
              Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text('Total Cases',
                              style: TextStyle(
                                  letterSpacing: 1.0,
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold
                              )
                          ),
                          Text(Utils.formatNumber(covid.cases).toString(),
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
                          Text('Active Cases',
                              style: TextStyle(
                                  letterSpacing: 1.0,
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold
                              )
                          ),
                          Text(Utils.formatNumber(covid.active).toString(),
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
                          Text('Total Deaths',
                              style: TextStyle(
                                  letterSpacing: 1.0,
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold
                              )),
                          Text(Utils.formatNumber(covid.deaths).toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                              )
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 7.0,
                      )
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

Widget buildGeneralDataCardToday(Covid covid) {
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
                        Text(Utils.formatNumber(covid.cases).toString(),
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
                        Text(Utils.formatNumber(covid.active).toString(),
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

Widget buildGeneralDataCardTotalCountries(Covid covid) {
  return Card(
    elevation: 3,
    color: Color(0xFFcb7a77),
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
                        Text('Affected Countries',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold
                            )
                        ),
                        Text(Utils.formatNumber(covid.affectedCountries).toString(),
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

Widget buildGeneralDataCardExtra(Covid covid) {
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
                        Text(Utils.formatNumber(covid.recovered).toString(),
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
                        Text(Utils.formatNumber(covid.tests).toString(),
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

Widget buildSimplePieChart(Covid covid) {
  List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0,'deaths', covid.deaths, covid.getPercentage(covid.deaths), new charts.Color(r: 203, g: 122, b: 119)),
      new LinearSales(1,'recover', covid.recovered, covid.getPercentage(covid.recovered), new charts.Color(r: 119, g: 188, b: 189)),
      new LinearSales(2,'active', covid.active, covid.getPercentage(covid.active), new charts.Color(r: 137, g: 210, b: 176)),
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

Widget buildLineChart(TimeLineListModel timeLineListModel) {

  return Card(
    elevation: 3,
    child: Center(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Echarts(
            option: '''
                  {
                  
                    grid: {
                      left: '3%',
                      right: '4%',
                      bottom: '3%',
                      containLabel: true
                    },
                    
                    legend: {
                      data: ['Cases', 'Deaths', 'Recovered']
                    },
                    xAxis: {
                      type: 'category',
                      data: ${jsonEncode(timeLineListModel.getDateList())},
                    },
                    yAxis: {
                      type: 'value'
                    },
                    dataZoom: [{
                              type: 'inside',
                              start: 0,
                              end: 100
                          }, {
                              start: 0,
                              end: 100,
                              handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
                              handleSize: '100%',
                              handleStyle: {
                                  color: '#fff',
                                  shadowBlur: 3,
                                  shadowColor: 'rgba(0, 0, 0, 0.6)',
                                  shadowOffsetX: 2,
                                  shadowOffsetY: 2
                              }
                          }], 
                    series: [
                      {
                        name: 'Cases',
                        data: ${jsonEncode(timeLineListModel.getCasesAmountsList())},
                        type: 'line',
                        smooth: true,
                        showSimbol : false,
                      },
                      {
                        name: 'Deaths',
                        data: ${jsonEncode(timeLineListModel.getDeathsAmountsList())},
                        type: 'line',
                        smooth: true,
                        showSimbol : false
                    },
                    {
                        name: 'Recovered',
                        data: ${jsonEncode(timeLineListModel.getRecoveredAmountsList())},
                        type: 'line',
                        smooth: true,
                        showSimbol : false
                    }
                    ]
                 }
                ''',
          ),
        ),
        width: 400,
        height: 300,
      ),
    ),
  );
}