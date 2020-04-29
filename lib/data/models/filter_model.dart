import 'package:flutter_bloc_covid/utils/enum_sort.dart';

class FilterModel {

  String title;
  Sort sort;

  FilterModel({this.title, this.sort});


  static List<FilterModel> createFilterModelList() {

    List<FilterModel> filterModelList = new List();
    filterModelList.add(new FilterModel(title: 'Country (A-Z)', sort:  Sort.AZ));
    filterModelList.add(new FilterModel(title: 'Country (Z-A)', sort:  Sort.ZA));

    filterModelList.add(new FilterModel(title: 'Total cases (high to low)', sort:  Sort.TOTAL_CASES_HIGH));
    filterModelList.add(new FilterModel(title: 'Total cases (low to high)', sort:  Sort.TODAY_CASES_LOW));
    filterModelList.add(new FilterModel(title: 'Cases Per One Million (high to low)', sort:  Sort.CASES_PER_ONE_MILLION_HIGH));
    filterModelList.add(new FilterModel(title: 'Cases Per One Million (low to high)', sort:  Sort.CASES_PER_ONE_MILLION_LOW));
    filterModelList.add(new FilterModel(title: 'Today Cases (high to low)', sort: Sort.TODAY_CASES_HIGH));
    filterModelList.add(new FilterModel(title: 'Today Cases (low to high)', sort: Sort.TODAY_CASES_LOW));

    filterModelList.add(new FilterModel(title: 'Total Deaths (high to low)', sort:  Sort.TOTAL_DEATHS_HIGH));
    filterModelList.add(new FilterModel(title: 'Total Deaths (low to high)', sort:  Sort.TOTAL_DEATHS_LOW));
    filterModelList.add(new FilterModel(title: 'Deaths Per One Million (high to low)', sort:  Sort.DEATHS_PER_ONE_MILLION_HIGH));
    filterModelList.add(new FilterModel(title: 'Deaths Per One Million (low to high)', sort:  Sort.DEATHS_PER_ONE_MILLION_LOW));
    filterModelList.add(new FilterModel(title: 'Today Deaths (high to low)', sort: Sort.TODAY_DEATHS_HIGH));
    filterModelList.add(new FilterModel(title: 'Today Deaths (low to high)', sort: Sort.TODAY_DEATHS_LOW));

    filterModelList.add(new FilterModel(title: 'Total Active Cases (high to low)', sort:  Sort.TOTAL_CASES_HIGH));
    filterModelList.add(new FilterModel(title: 'Total Active Cases (low to high)', sort:  Sort.TOTAL_CASES_LOW));

    filterModelList.add(new FilterModel(title: 'Total Recovered (high to low)', sort:  Sort.TOTAL_RECOVERIES_HIGH));
    filterModelList.add(new FilterModel(title: 'Total Recovered (low to high)', sort:  Sort.TOTAL_RECOVERIES_LOW));

    filterModelList.add(new FilterModel(title: 'Total Tests (high to low)', sort: Sort.TOTAL_TESTS_HIGH));
    filterModelList.add(new FilterModel(title: 'Total Tests (low to high)', sort: Sort.TOTAL_TEST_LOW));
    filterModelList.add(new FilterModel(title: 'Tests Per One Million (high to high)', sort: Sort.TESTS_PER_MILLION_HIGH));
    filterModelList.add(new FilterModel(title: 'Tests Per One Million (low to high)', sort: Sort.TEST_PER_MILLION_LOW));

    return filterModelList;

  }

}