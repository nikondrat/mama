import 'package:mama/src/data.dart';
import 'package:mobx/mobx.dart';

part 'promo.g.dart';

class PromoViewStore extends _PromoViewStore with _$PromoViewStore {
  PromoViewStore({
    required super.restClient,
  });
}

abstract class _PromoViewStore with Store {
  _PromoViewStore({
    required this.restClient,
  });
  final RestClient restClient;

  void activatePromo(String promocode) {
    restClient.post(Endpoint().promocode, queryParams: {
      'promocode': promocode,
    }, body: {}).then((v) {});
  }
}
