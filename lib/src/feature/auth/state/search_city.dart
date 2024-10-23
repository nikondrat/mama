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
      'q': query.capitalizeFirstLetter(),
      'limit': '20',
      'country_id': '1',
    }).then((v) {
      logger.info('$v');
      final CitiesData data = CitiesData.fromJson(v!);
      return data.data;
    });
    // .catchError((e) {
    //   return CitiesData(
    //       [City(id: 1, name: 'adas', country: 1, countryName: '')]);
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
