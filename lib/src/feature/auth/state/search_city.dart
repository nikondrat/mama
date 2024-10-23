// import 'package:mama/src/feature/auth/data/entity/city.dart';
// import 'package:mama/src/feature/auth/data/repository/repository.dart';
// import 'package:mobx/mobx.dart';

// part 'search_state.g.dart';

// class SearchState = SearchStateBase with _$SearchState;

// abstract class SearchStateBase with Store {
//   @observable
//   List<City> newList = [];

//   final repository = CityRepository();

//   @action
//   Future<void> searchCity({required String city}) async {
//     var result = repository.data
//         .where((value) =>
//             value.city.toLowerCase().toLowerCase().contains(city.toLowerCase()))
//         .toList();
//     newList = result;
//   }

//   @action
//   Future<void> choose({required String city}) async {
//     ///save city to db
//     newList = [];
//   }

//   void dispose() {}
// }

import 'package:mama/src/data.dart';
import 'package:mobx/mobx.dart';

part 'search_city.g.dart';

class SearchCityStore extends _SearchCityStore with _$SearchCityStore {
  SearchCityStore({
    required super.restClient,
  });
}

abstract class _SearchCityStore with Store {
  _SearchCityStore({
    required this.restClient,
  });

  final RestClient restClient;

  @observable
  ObservableFuture<List<City>> fetchCitiesFuture = emptyResponse;

  @observable
  ObservableList<City> cities = ObservableList();

  @observable
  String query = '*';

  @action
  void setQuery(String value) {
    query = value;
    searchCity();
  }

  @action
  Future<List<City>> searchCity() async {
    final future = restClient.get(Endpoint().cities, queryParams: {
      'q': query,
      'limit': '20',
      'country_id': '1',
    }).then((v) {
      final CitiesData data = CitiesData.fromJson(v!);
      return data.data;
    });
    // .catchError((e) {
    //   return CitiesData([City(id: 0, name: 'sdfsd', country: 1)]);
    // });

    fetchCitiesFuture = ObservableFuture(future);

    return cities = ObservableList.of(await future);
  }

  void dispose() {
    query = '';
    fetchCitiesFuture = emptyResponse;
  }

  @computed
  bool get hasResults => fetchCitiesFuture.status == FutureStatus.fulfilled;

  static ObservableFuture<List<City>> emptyResponse =
      ObservableFuture.value([]);
}
