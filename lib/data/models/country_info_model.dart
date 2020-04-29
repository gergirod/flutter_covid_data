import 'package:equatable/equatable.dart';

class CountryInfoModel extends Equatable {
  int id;
  String iso2;
  String iso3;
  dynamic lat;
  dynamic long;
  String flag;

  CountryInfoModel({
    this.id,
    this.iso2,
    this.iso3,
    this.lat,
    this.long,
    this.flag
  });

  factory CountryInfoModel.fromMap(Map<String, dynamic> map) {

    return CountryInfoModel(
      id: map['_id'],
      iso2: map['iso2'],
      iso3: map['iso3'],
      lat: map['lat'],
      long: map['long'],
      flag: map['flag']
    );

  }

  @override
  List<Object> get props => [id, iso2, iso3, lat, long, flag];
}