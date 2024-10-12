import 'package:mama/src/data.dart';
import 'package:mobx/mobx.dart';

part 'records.g.dart';

class ConsultationRecordsStore extends _ConsultationRecordsStore
    with _$ConsultationRecordsStore {
  ConsultationRecordsStore({
    required super.restClient,
  });
}

abstract class _ConsultationRecordsStore with Store {
  final RestClient restClient;

  _ConsultationRecordsStore({
    required this.restClient,
  });

  @observable
  ObservableFuture<Consultations> fetchConsultationsFuture = emptyResponse;

  @action
  Future<Consultations> getData() async {
    final Future<Consultations> future =
        restClient.get(Endpoint.consultation).then((v) {
      if (v != null) {
        final data = Consultations.fromJson(v);

        return data;
      }
      return emptyResponse;
    });
    fetchConsultationsFuture = ObservableFuture(future);
    return await future;
  }

  @computed
  bool get hasResults =>
      fetchConsultationsFuture != emptyResponse &&
      fetchConsultationsFuture.status == FutureStatus.fulfilled;

  static ObservableFuture<Consultations> emptyResponse = ObservableFuture.value(
    Consultations(data: []),
  );
}
