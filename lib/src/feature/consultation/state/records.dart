import 'package:mama/src/data.dart';
import 'package:mobx/mobx.dart';

part 'records.g.dart';

class ConsultationRecordsStore extends _ConsultationRecordsStore
    with _$ConsultationRecordsStore {
  ConsultationRecordsStore({
    required super.restClient,
  });
}

abstract class _ConsultationRecordsStore with Store, BaseStore<Consultations> {
  final RestClient restClient;

  _ConsultationRecordsStore({
    required this.restClient,
  });

  Future fetchUserConsultations() async {
    return await fetchData(restClient.get(Endpoint().userConsultations), (v) {
      final data = Consultations.fromJson(v);
      listData = ObservableList.of(data.data ?? []);
      return data;
    });
  }
}
