
import 'dart:developer';

import 'package:mama/src/feature/register/data/entity/city.dart';
import 'package:mama/src/feature/register/data/repository/repository.dart';
import 'package:mobx/mobx.dart';

part 'search_state.g.dart';

class SearchState = SearchStateBase with _$SearchState;
abstract class SearchStateBase with Store{
  @observable
  List<City> newList = [];

  final repository = CityRepository();

  @action
  Future<void> searchCity({required String city}) async {
    var result = repository.data.where((value) => value.city.toLowerCase().toLowerCase().contains(city.toLowerCase())).toList();
    newList = result;
  }

  @action
  Future<void> choose({required String city}) async {
    ///save city to db
    newList = [];
  }

}