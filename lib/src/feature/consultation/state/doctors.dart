import 'package:mama/src/data.dart';
import 'package:mobx/mobx.dart';

part 'doctors.g.dart';

class DoctorsStore extends _DoctorsStore with _$DoctorsStore {
  DoctorsStore({
    required super.restClient,
  });
}

abstract class _DoctorsStore with Store, BaseStore {
  final RestClient restClient;

  _DoctorsStore({required this.restClient});

  Future loadData() async {
    return await fetchData(
        restClient.get(Endpoint.doctor, queryParams: {
          'limit': '5',
        }), (v) {
      final data = Doctors.fromJson(v);
      listData = ObservableList.of(data.data ?? []);
      return data;
    });
  }
}
